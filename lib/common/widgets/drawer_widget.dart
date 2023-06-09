import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/storage/quiz_storage_bloc.dart';
import '../../features/theme/theme_info.dart';
import '../../generated/locale_keys.g.dart';
import '../router.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: ColoredBox(
              color: blue,
              child: Padding(
                padding: const EdgeInsets.only(top: 16, left: 16),
                child: Text(tr(LocaleKeys.quiz_menu),style: buttonText,),
              ),
            ),
          ),
          ListTile(
            title: Text(
              tr(LocaleKeys.history),
              style: drawerButtonText,
            ),
            onTap: () {
              context.read<QuizStorageBloc>().add(QuizStorageReadEvent());
              Navigator.pop(context);
              context.push(historyScreenRoute);
            },
          ),
          ListTile(
            title: Text(
              tr(LocaleKeys.settings),
              style: drawerButtonText,
            ),
            onTap: () {
              Navigator.pop(context);
              context.push(settingsScreenRoute);
            },
          ),
        ],
      ),
    );
  }
}
