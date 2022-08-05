import 'package:calculator/modules/settings/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GetX<SettingsController>(
      builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            const Text(
              "Color Scheme",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => controller.modifyColor(colors.kPrimaryColor),
                  child: Container(
                    height: height * 0.07,
                    width: height * 0.07,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.kPrimaryColor),
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.modifyColor(colors.kSecondaryColor),
                  child: Container(
                    height: height * 0.07,
                    width: height * 0.07,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.kSecondaryColor),
                  ),
                ),
                GestureDetector(
                    onTap: () => controller.modifyColor(colors.kThirdColor),
                    child: Container(
                      height: height * 0.07,
                      width: height * 0.07,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.kThirdColor),
                    )),
              ],
            )
          ],
        );
      },
    );
  }
}
