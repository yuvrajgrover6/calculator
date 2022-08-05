import 'package:calculator/modules/settings/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

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
    return GetX<SettingsController>(
      builder: (settingsController) {
        return InkWell(
          radius: settingsController.kButtonRadius,
          onTap: () => onPressed(),
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(settingsController.kButtonRadius),
              color: color,
            ),
            child: Center(
              child: Text(
                text,
                style:
                    TextStyle(color: fontColor ?? Colors.black, fontSize: 20),
              ),
            ),
          ),
        );
      },
    );
  }
}
