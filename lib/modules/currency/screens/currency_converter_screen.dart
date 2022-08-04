import 'package:calculator/contants.dart';
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

    return Scaffold(
      body: Container(
          child: Obx(() => FutureBuilder(
              future: controller.apicall(controller.amount.value),
              builder: (context, snapshot) {
                return Column(
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
                            controller.currencies.length,
                            (index) => DropdownMenuItem(
                              value: controller.currencies[index],
                              child: Text(controller.currencies[index]),
                            ),
                          ),
                          onChanged: (value) {
                            controller.currency1.value = value.toString();
                          },
                        ),
                      ),
                      trailing: Container(
                        color: Colors.white,
                        width: width * 0.5,
                        height: height * 0.2,
                        child: TextFormField(
                          focusNode: focusnode,
                          cursorColor: kPrimaryColor,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              controller.amount.value = 0;
                            } else {
                              controller.amount.value = double.parse(value);
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: kPrimaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: kPrimaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: kPrimaryColor),
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
                            controller.currencies.length,
                            (index) => DropdownMenuItem(
                              value: controller.currencies[index],
                              child: Text(controller.currencies[index]),
                            ),
                          ),
                          onChanged: (value) {
                            controller.currency2.value = value.toString();
                          },
                        ),
                      ),
                      trailing: Container(
                        width: width * 0.5,
                        height: height * 0.1,
                        child: TextFormField(
                          controller: controller.resultController,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: kPrimaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: kPrimaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: kPrimaryColor),
                            ),
                          ),
                          autofocus: true,
                          keyboardAppearance: Brightness.dark,
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ),
                  ],
                );
              }))),
    );
  }
}
