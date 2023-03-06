import 'package:bloc_quiz_training/common/utils/get_flavor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../assets.dart';
import '../services/credentials_loader.dart';
import 'logger.dart';

Future<Credentials> loadCredentials() async {
  try {
    final flavor = await getFlavor();
    final credentials = await CredentialsLoader(
      pathToFile: _credentialsFileForFlavor(flavor),
    ).load();
    return credentials;
  } catch (e) {
    log.fine('loadCredentials error: $e');
    rethrow;
  }
}

String _credentialsFileForFlavor(String? flavor) {
  switch (flavor) {
    case 'prod':
      return credentialsProdFile;
    case 'dev':
      return credentialsDevFile;
    default:
      return credentialsDevFile;
  }
}

class EnumToString {
  String? parse(dynamic enumItem) {
    if (enumItem == null) {
      return null;
    }
    return enumItem.toString().split('.')[1];
  }

  T? fromString<T>(List<T> enumValues, String? value) {
    if (value == null) {
      return null;
    }

    return enumValues
        .singleWhere((enumItem) => EnumToString().parse(enumItem) == value);
  }
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log.fine(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log.fine(transition);
  }
}
