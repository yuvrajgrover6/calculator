import 'package:calculator/localDBController.dart';
import 'package:calculator/modules/currency/API/CurrencyConvert.dart';
import 'package:calculator/modules/settings/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/currency_controller.dart';

class CurrencyConverter extends StatelessWidget {
  final focusnode;
  const CurrencyConverter({Key? key, required this.focusnode})
      : super(key: key);

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final CurrencyController controller = Get.put(CurrencyController());

    return GetX<SettingsController>(
      builder: (settingsController) {
        return Scaffold(
          backgroundColor: settingsController.kBackgroundColor,
          body: Container(
            child: Column(
              children: [
                SizedBox(height: height * 0.04),
                ListTile(
                  leading: Container(
                    width: width * 0.2,
                    height: height * 0.2,
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(),
                      value: controller.currency1.value,
                      items: List.generate(
                        CurrencyApi.supportedCurrencies.length,
                        (index) => DropdownMenuItem(
                          value: CurrencyApi.supportedCurrencies[index],
                          child: Text(CurrencyApi.supportedCurrencies[index]),
                        ),
                      ),
                      onChanged: (value) {
                        controller.currency1.value = value.toString();

                        controller.exchangeRates();
                      },
                    ),
                  ),
                  trailing: Container(
                    color: Colors.white,
                    width: width * 0.5,
                    height: height * 0.2,
                    child: TextFormField(
                      focusNode: focusnode,
                      cursorColor: settingsController.kPrimaryColor,
                      onChanged: (value) {
                        if (value.isEmpty) {
                          controller.amount.value = 0;
                          controller.exchangeRates();
                        } else {
                          controller.amount.value = double.parse(value);
                          controller.exchangeRates();
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: settingsController.kPrimaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: settingsController.kPrimaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: settingsController.kPrimaryColor),
                        ),
                      ),
                      autofocus: true,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.04),
                ListTile(
                  leading: Container(
                    width: width * 0.2,
                    height: height * 0.1,
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(),
                      value: controller.currency2.value,
                      items: List.generate(
                        CurrencyApi.supportedCurrencies.length,
                        (index) => DropdownMenuItem(
                          value: CurrencyApi.supportedCurrencies[index],
                          child: Text(CurrencyApi.supportedCurrencies[index]),
                        ),
                      ),
                      onChanged: (value) {
                        controller.currency2.value = value.toString();
                        controller.exchangeRates();
                      },
                    ),
                  ),
                  trailing: Container(
                    width: width * 0.5,
                    height: height * 0.1,
                    child: Obx(() => TextFormField(
                          controller: TextEditingController(
                              text: controller.result.value),
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: settingsController.kPrimaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: settingsController.kPrimaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: settingsController.kPrimaryColor),
                            ),
                          ),
                          autofocus: true,
                          keyboardAppearance: Brightness.dark,
                          keyboardType: TextInputType.phone,
                        )),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
