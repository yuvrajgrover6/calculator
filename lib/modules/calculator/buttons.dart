import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CalButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;
  final Color? fontColor;
  const CalButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.color,
      this.fontColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 50,
      onTap: () => onPressed(),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: fontColor ?? Colors.black, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
