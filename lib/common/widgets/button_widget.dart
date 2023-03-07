import 'package:bloc_quiz_training/features/theme/theme.dart';
import 'package:flutter/material.dart';

import 'animated_path_painter.dart';

class ButtonWidget extends StatefulWidget {
  final double? opacity;
  final Animation<double>? animation;
  final String buttonTitle;
  final VoidCallback onTap;
  const ButtonWidget({
    Key? key,
    required this.opacity,
    required this.animation,
    required this.buttonTitle,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  final double buttonHeight = 40;
  final double buttonWidth = 160;
  final double buttonRadius = 8;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        children: [
          AnimatedOpacity(
            opacity: widget.opacity!,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 600),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(buttonRadius),
              child: Container(
                height: buttonHeight,
                width: buttonWidth,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(buttonRadius)),
                child: ColoredBox(
                  color: darkBlue,
                  child: Center(
                    child: Text(
                      widget.buttonTitle,
                      style: const TextStyle(color: white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (widget.animation!.value != 1.0)
            SizedBox(
              height: buttonHeight,
              width: buttonWidth,
              child: CustomPaint(
                painter: AnimatedPathPainter(
                  widget.animation,
                  color: white,
                  radius: buttonRadius,
                ),
              ),
            ),
          if (widget.animation!.value == 1.0)
            Container(
              height: buttonHeight,
              width: buttonWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(buttonRadius),
                  border: Border.all(
                    color: darkerBlue,
                    width: 2,
                  )),
            )
        ],
      ),
    );
  }
}
