
import 'package:flutter/cupertino.dart';

import '../../features/theme/theme_info.dart';

class BaseButton extends StatelessWidget {
  final String? title;
  final Widget? icon;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final bool isInternetConnected;
  final Color buttonColor;
  final Color disableColor;
  final Color titleColor;
  final double buttonHeight;
  final double buttonWidth;
  final double buttonRadius;
  final double verticalTitleMargin;
  final double horizontalTitleMargin;

  const BaseButton(
      {Key? key,
        this.title,
        this.icon,
        this.buttonHeight = 50,
        this.buttonWidth = double.infinity,
        this.onPressed,
        this.isEnabled = false,
        required this.isInternetConnected,
        this.buttonRadius = 8,
        required this.buttonColor,
        this.disableColor = simpleGray,
        this.titleColor = textBlack,
        this.verticalTitleMargin = 15,
        this.horizontalTitleMargin = 30})
      : assert(title != null && icon == null || title == null && icon != null);

  bool get isButtonActive => isEnabled && isInternetConnected;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: const EdgeInsets.all(0),
        onPressed: isButtonActive
            ? () {
          // Vibrate.feedback(FeedbackType.heavy);
          onPressed?.call();
        }
            : null,
        child: Container(
          key: const ValueKey('button color'),
          height: buttonHeight,
          width: buttonWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(buttonRadius)),
            color: isButtonActive ? buttonColor : disableColor,
          ),
          child: title != null
              ? Container(
            margin: EdgeInsets.symmetric(vertical: verticalTitleMargin, horizontal: horizontalTitleMargin),
            child: Text(
              title!,
              textAlign: TextAlign.center,
              style: buttonText.copyWith(color: titleColor),
            ),
          )
              : Center(child: icon),
        ));
  }
}
