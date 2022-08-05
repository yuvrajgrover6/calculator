// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calculator/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

enum colors {
  kPrimaryColor,
  kSecondaryColor,
  kThirdColor,
}

class SettingsController extends GetxController {
  final Map<colors, Rx<Color>> colorScheme = {
    colors.kPrimaryColor: Rx(Colors.purple),
    colors.kSecondaryColor: Rx(Color.fromARGB(255, 243, 210, 249)),
    colors.kThirdColor: Rx(Color.fromARGB(255, 218, 217, 217)),
  };

  Color get kPrimaryColor => colorScheme[colors.kPrimaryColor]!.value;
  Color get kSecondaryColor => colorScheme[colors.kSecondaryColor]!.value;
  Color get kThirdColor => colorScheme[colors.kThirdColor]!.value;

  get colorsLocalDB => LocalDBController.instance.colorsLocalDB;
  SettingsController();
  @override
  void onInit() {
    super.onInit();
    colors.values.forEach((element) {
      try {
        colorScheme[element]!.value = Color(colorsLocalDB.get(element.name));
      } catch (e) {
        ; // TODO: skip for now
      }
    });
  }

  primaryColorSwitcher() {}
  modifyColor(colors changed) {
    Color toChange = colorScheme[changed]!.value;
    Get.dialog(Material(
      child: AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: toChange,
            onColorChanged: (color) {
              colorScheme[changed]!.value = color;
            },
          ),
          // Use Material color picker:
          //
          // child: MaterialPicker(
          //   pickerColor: pickerColor,
          //   onColorChanged: changeColor,
          //   showLabel: true, // only on portrait mode
          // ),
          //
          // Use Block color picker:
          //
          // child: BlockPicker(
          //   pickerColor: currentColor,
          //   onColorChanged: changeColor,
          // ),
          //
          // child: MultipleChoiceBlockPicker(
          //   pickerColors: currentColors,
          //   onColorsChanged: changeColors,
          // ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Got it'),
            onPressed: () {
              colorsLocalDB.put(
                  changed.name, colorScheme[changed]!.value.value);
              Get.back();
            },
          ),
        ],
      ),
    ));
  }
}
