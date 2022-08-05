import 'package:calculator/modules/calculator/screens/calculator_screen.dart';
import 'package:calculator/modules/currency/screens/currency_converter_screen.dart';
import 'package:calculator/modules/settings/controller/settings_controller.dart';
import 'package:calculator/modules/settings/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var focusNode = FocusNode();

    return GetX<SettingsController>(
      builder: (controller) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: controller.kPrimaryColor,

              title: TabBar(
                // TODO: change colors to text colors
                  unselectedLabelColor: controller.kThirdColor,
                  labelColor: controller.kSecondaryColor,
                  indicatorWeight: 0.1,
                  tabs: const [
                    Tab(
                      child: Text('Calculator'),
                    ),
                    Tab(
                      child: Text('Currency Converter'),
                    ),
                    Tab(
                      child: Text('Settings'),
                    )
                  ]),
              // title: const Text('Calculator'),
            ),
            body: TabBarView(
              children: [
                Calculator(),
                CurrencyConverter(
                  focusnode: focusNode,
                ),
                SettingsScreen()
              ],
            ),
          ),
        );
      },
    );
  }
}
