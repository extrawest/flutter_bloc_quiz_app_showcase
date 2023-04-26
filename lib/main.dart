import 'package:bloc_quiz_training/common/router.dart';
import 'package:bloc_quiz_training/common/services/credentials_loader.dart';
import 'package:bloc_quiz_training/common/utils/app_utils.dart';
import 'package:bloc_quiz_training/features/theme/bloc/theme_bloc.dart';
import 'package:bloc_quiz_training/features/theme/theme_info.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_strategy/url_strategy.dart';

import 'common/assets.dart';
import 'common/services/database_boxes.dart';
import 'common/utils/logger.dart';
import 'features/features.dart';
import 'features/storage/storage.dart';
import 'network/api_client.dart';

const isProductionEnvKey = 'IS_PRODUCTION';
const englishLocale = Locale('en', 'US');
const ukrainianLocale = Locale('uk', 'UA');

GetIt getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  setPathUrlStrategy();

  await Hive.initFlutter();
  Hive.registerAdapter(SavedQuizAdapter());
  Hive.registerAdapter(QuizTypeAdapter());

  final themeBox = await Hive.openBox(ThemeBox.name);
  final quizBox = await Hive.openBox(QuizBox.name);

  final credentials = await loadCredentials();
  setupLogger();

  getIt.registerSingleton<ApiClientImpl>(ApiClientImpl(apiDomain: credentials.apiDomain));

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  final app = EasyLocalization(
    supportedLocales: const [englishLocale, ukrainianLocale],
    path: translationsFolderPath,
    fallbackLocale: englishLocale,
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(themeBox)..add(const InitTheme()),
        ),
        BlocProvider(
          create: (context) => QuizStorageBloc(quizBox)..add(QuizStorageReadEvent()),
        ),
      ],
      child: _RepositoriesHolder(credentials, child: const Application()),
    ),
  );
  // Setup of the services used in the application
  runApp(app);
}

class _RepositoriesHolder extends StatelessWidget {
  final Widget child;
  final Credentials credentials;

  const _RepositoriesHolder(
    this.credentials, {
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // put your common repositories and services here
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => OneAnswerQuizRepositoryImpl(
            oneAnswerQuizApiService: OneAnswerQuizApiServiceImpl(
              getIt<ApiClientImpl>(),
            ),
          ),
        ),
        RepositoryProvider(
          create: (context) => TrueFalseQuizRepositoryImpl(
            trueFalseQuizApiService: TrueFalseQuizApiServiceImpl(
              getIt<ApiClientImpl>(),
            ),
          ),
        ),
      ],
      child: Builder(builder: (context) => child),
    );
  }
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return DevicePreview(
          enabled: kIsWeb,
          builder: (context) => MaterialApp.router(
            useInheritedMediaQuery: true,
            title: 'Simple Quiz',
            routerConfig: goRouter,
            darkTheme: darkTheme,
            theme: state.themeData,
            themeMode: state.themeMode,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          ),
        );
      },
    );
  }
}
