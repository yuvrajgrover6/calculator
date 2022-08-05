import 'package:calculator/modules/settings/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GetX<SettingsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: controller.kBackgroundColor,
          body: Container(
            height: height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.03),
                  const Text(
                    "Customizations",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                    height: height * 0.7,
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () =>
                              controller.modifyColor(colors.kPrimaryColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Primary Color',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.05),
                              ),
                              SizedBox(
                                width: width * 0.1,
                              ),
                              Container(
                                height: height * 0.07,
                                width: height * 0.07,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black),
                                    color: controller.kPrimaryColor),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              controller.modifyColor(colors.kSecondaryColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Secondary Color',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.05),
                              ),
                              SizedBox(
                                width: width * 0.1,
                              ),
                              Container(
                                height: height * 0.07,
                                width: height * 0.07,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black),
                                    color: controller.kSecondaryColor),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: () =>
                                controller.modifyColor(colors.kThirdColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'NumPad Color',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.05),
                                ),
                                SizedBox(
                                  width: width * 0.1,
                                ),
                                Container(
                                  height: height * 0.07,
                                  width: height * 0.07,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black),
                                      color: controller.kThirdColor),
                                ),
                              ],
                            )),
                        GestureDetector(
                            onTap: () =>
                                controller.modifyColor(colors.kBackgroundColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Background Color',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.05),
                                ),
                                SizedBox(
                                  width: width * 0.1,
                                ),
                                Container(
                                  height: height * 0.07,
                                  width: height * 0.07,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black),
                                      color: controller.kBackgroundColor),
                                ),
                              ],
                            )),
                        GestureDetector(
                            onTap: () => controller
                                .modifyColor(colors.kPrimaryTextColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Primary Text',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.05),
                                ),
                                SizedBox(
                                  width: width * 0.1,
                                ),
                                Container(
                                  height: height * 0.07,
                                  width: height * 0.07,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black),
                                      color: controller.kPrimaryTextColor),
                                ),
                              ],
                            )),
                        GestureDetector(
                            onTap: () => controller
                                .modifyColor(colors.kSecondaryTextColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Secondary Text',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.05),
                                ),
                                SizedBox(
                                  width: width * 0.1,
                                ),
                                Container(
                                  height: height * 0.07,
                                  width: height * 0.07,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black),
                                      color: controller.kSecondaryTextColor),
                                ),
                              ],
                            )),
                        GestureDetector(
                            onTap: () =>
                                controller.modifyColor(colors.kNumpadTextColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Numpad Text',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.05),
                                ),
                                SizedBox(
                                  width: width * 0.1,
                                ),
                                Container(
                                  height: height * 0.07,
                                  width: height * 0.07,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black),
                                      color: controller.kNumpadTextColor),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  Container(
                    height: height * 0.12,
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Select Buttons Radius',
                          style: TextStyle(fontSize: 20),
                        ),
                        SfSlider(
                          tooltipShape: const SfPaddleTooltipShape(),
                          activeColor: controller.kPrimaryColor,
                          inactiveColor: controller.kSecondaryColor,
                          min: 0.0,
                          max: 50.0,
                          interval: 1.0,
                          showTicks: true,
                          enableTooltip: true,
                          value: controller.kButtonRadius,
                          onChanged: controller.modifyButtonRadius,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Container(
                    width: width * 0.5,
                    height: height * 0.06,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              controller.kPrimaryColor)),
                      onPressed: () {
                        controller.reset();
                      },
                      child: Text(
                        'Reset Customization',
                        style: TextStyle(color: controller.kPrimaryTextColor),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
