import 'package:calculator/localDBController.dart';
import 'package:calculator/modules/settings/controller/settings_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../buttons.dart';
import '../controller/CalculatorController.dart';

class Calculator extends StatelessWidget {
  Calculator({Key? key}) : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    final controller = Get.put(CalculatorController());
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GetX<SettingsController>(
      builder: (settingsController) {
        return Scaffold(
          backgroundColor: settingsController.kBackgroundColor,
          body: Column(
            children: [
              Container(
                height: height * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Obx(() => Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.05,
                              vertical: height * 0.01),
                          child: Text(
                            controller.history.value,
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: width * 0.07,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.grey),
                          ),
                        )),
                    Obx(
                      () => Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.05,
                              vertical: height * 0.01),
                          alignment: Alignment.bottomRight,
                          child: Text(
                            controller.textToDisplay.value,
                            style: TextStyle(fontSize: width * 0.1),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                height: height * 0.58,
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalButton(
                                text: 'C',
                                onPressed: () => controller.buttonOnClick('C'),
                                color: settingsController.kSecondaryColor,
                                fontColor:
                                    settingsController.kSecondaryTextColor,
                              ),
                              CalButton(
                                text: '%',
                                onPressed: () => controller.buttonOnClick('%'),
                                color: settingsController.kSecondaryColor,
                                fontColor:
                                    settingsController.kSecondaryTextColor,
                              ),
                              CalButton(
                                text: '⌫',
                                onPressed: () => controller.buttonOnClick('⌫'),
                                color: settingsController.kSecondaryColor,
                                fontColor:
                                    settingsController.kSecondaryTextColor,
                              ),
                              CalButton(
                                text: '÷',
                                onPressed: () => controller.buttonOnClick('/'),
                                color: settingsController.kPrimaryColor,
                                fontColor: settingsController.kPrimaryTextColor,
                              ),
                            ])),
                    Expanded(
                        flex: 1,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalButton(
                                text: '7',
                                onPressed: () => controller.buttonOnClick('7'),
                                color: settingsController.kThirdColor,
                                fontColor: settingsController.kNumpadTextColor,
                              ),
                              CalButton(
                                text: '8',
                                onPressed: () => controller.buttonOnClick('8'),
                                color: settingsController.kThirdColor,
                                fontColor: settingsController.kNumpadTextColor,
                              ),
                              CalButton(
                                text: '9',
                                onPressed: () => controller.buttonOnClick('9'),
                                color: settingsController.kThirdColor,
                                fontColor: settingsController.kNumpadTextColor,
                              ),
                              CalButton(
                                text: '\u0078',
                                onPressed: () => controller.buttonOnClick('*'),
                                color: settingsController.kPrimaryColor,
                                fontColor: settingsController.kPrimaryTextColor,
                              ),
                            ])),
                    Expanded(
                        flex: 1,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalButton(
                                text: '4',
                                onPressed: () => controller.buttonOnClick('4'),
                                color: settingsController.kThirdColor,
                                fontColor: settingsController.kNumpadTextColor,
                              ),
                              CalButton(
                                text: '5',
                                onPressed: () => controller.buttonOnClick('5'),
                                color: settingsController.kThirdColor,
                                fontColor: settingsController.kNumpadTextColor,
                              ),
                              CalButton(
                                text: '6',
                                onPressed: () => controller.buttonOnClick('6'),
                                color: settingsController.kThirdColor,
                                fontColor: settingsController.kNumpadTextColor,
                              ),
                              CalButton(
                                text: '-',
                                onPressed: () => controller.buttonOnClick('-'),
                                color: settingsController.kPrimaryColor,
                                fontColor: settingsController.kPrimaryTextColor,
                              ),
                            ])),
                    Expanded(
                        flex: 1,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalButton(
                                text: '1',
                                onPressed: () => controller.buttonOnClick('1'),
                                color: settingsController.kThirdColor,
                                fontColor: settingsController.kNumpadTextColor,
                              ),
                              CalButton(
                                text: '2',
                                onPressed: () => controller.buttonOnClick('2'),
                                fontColor: settingsController.kNumpadTextColor,
                                color: settingsController.kThirdColor,
                              ),
                              CalButton(
                                text: '3',
                                onPressed: () => controller.buttonOnClick('3'),
                                color: settingsController.kThirdColor,
                                fontColor: settingsController.kNumpadTextColor,
                              ),
                              CalButton(
                                text: '+',
                                onPressed: () => controller.buttonOnClick('+'),
                                color: settingsController.kPrimaryColor,
                                fontColor: settingsController.kPrimaryTextColor,
                              ),
                            ])),
                    Expanded(
                        flex: 1,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalButton(
                                text: '00',
                                onPressed: () => controller.buttonOnClick('00'),
                                color: settingsController.kThirdColor,
                                fontColor: settingsController.kNumpadTextColor,
                              ),
                              CalButton(
                                text: '0',
                                onPressed: () => controller.buttonOnClick('0'),
                                color: settingsController.kThirdColor,
                                fontColor: settingsController.kNumpadTextColor,
                              ),
                              CalButton(
                                text: '.',
                                onPressed: () => controller.buttonOnClick('.'),
                                color: settingsController.kThirdColor,
                                fontColor: settingsController.kNumpadTextColor,
                              ),
                              CalButton(
                                text: '=',
                                onPressed: () => controller.buttonOnClick('='),
                                color: settingsController.kPrimaryColor,
                                fontColor: settingsController.kPrimaryTextColor,
                              ),
                            ]))
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
