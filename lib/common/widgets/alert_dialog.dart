import 'package:bloc_quiz_training/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({Key? key, this.callback}) : super(key: key);

  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(tr(LocaleKeys.attention)),
      content: Text(tr(LocaleKeys.you_will_lose)),
      actions: [
        TextButton(
          child: Text(tr(LocaleKeys.cansel)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text(tr(LocaleKeys.continu)),
          onPressed: () {
            callback?.call();
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
