import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../generated/locale_keys.g.dart';
import '../../theme/theme_info.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final VoidCallback callBack;

  const BottomButton({Key? key, required this.title, required this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        height: 50,
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 3,
              child: Center(
                  child: Text(
                tr(LocaleKeys.validate),
                style: text,
              )),
            ),
            Expanded(
                flex: 2,
                child: Center(
                    child: Text(
                  title,
                  style: text,
                )))
          ],
        ),
      ),
    );
  }
}
