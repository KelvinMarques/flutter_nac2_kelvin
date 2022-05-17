import 'package:flutter/material.dart';

class StandardCardContent extends StatelessWidget {
  final String? leftText;
  final String rightText;

  StandardCardContent({required this.leftText, this.rightText = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue, width: 2)),
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [Text(leftText!), const Spacer(), Text(rightText)],
      ),
    );
  }
}
