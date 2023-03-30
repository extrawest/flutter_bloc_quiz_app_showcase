import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final VoidCallback callBack;

  const BottomButton({Key? key, required this.title, required this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        height: 40,
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Expanded(
              child: Center(child: Text('Tap to validate answer')),
            ),
            Expanded(child: Center(child: Text(title)))
          ],
        ),
      ),
    );
  }
}