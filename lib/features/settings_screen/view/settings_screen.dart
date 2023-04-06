import 'package:bloc_quiz_training/features/theme/bloc/theme_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recase/recase.dart';

import '../../../generated/locale_keys.g.dart';
import '../../theme/theme_info.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr(LocaleKeys.settings)),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: const [Expanded(child: ThemeSwitcherWidget())],
      ),
    );
  }
}

class ThemeSwitcherWidget extends StatelessWidget {
  const ThemeSwitcherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                tr(LocaleKeys.brightness_theme),
                style: notifierTextLabel,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Column(
                children: [
                  RadioListTile(
                    title:  Text(
                      tr(LocaleKeys.light).sentenceCase,
                      style: buttonText,
                    ),
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    value: ThemeMode.light,
                    groupValue: state.themeMode,
                    onChanged: (value) {
                      context.read<ThemeBloc>().add(SetTheme(value!));
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      tr(LocaleKeys.dark).sentenceCase,
                      style: buttonText,
                    ),
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    value: ThemeMode.dark,
                    groupValue: state.themeMode,
                    onChanged: (value) {
                      context.read<ThemeBloc>().add(SetTheme(value!));
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      tr(LocaleKeys.system).sentenceCase,
                      style: buttonText,
                    ),
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    value: ThemeMode.system,
                    groupValue: state.themeMode,
                    onChanged: (value) {
                      context.read<ThemeBloc>().add(SetTheme(value!));
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
