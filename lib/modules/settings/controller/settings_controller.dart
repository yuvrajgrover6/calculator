// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:calculator/localDBController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'dart:math' as math;

enum colors {
  kPrimaryColor,
  kSecondaryColor,
  kThirdColor,
  kNumPadColor,
  kBackgroundColor,
  kPrimaryTextColor,
  kSecondaryTextColor,
  kNumpadTextColor,
  kButtonRadius
}

class SettingsController extends GetxController {
  static const Map<colors, Object> defaultSettings = {
    colors.kPrimaryColor: Colors.purple,
    colors.kSecondaryColor: Color.fromARGB(255, 243, 210, 249),
    colors.kThirdColor: Color.fromARGB(255, 218, 217, 217),
    colors.kNumPadColor: Color.fromARGB(255, 218, 217, 217),
    colors.kBackgroundColor: Color.fromARGB(255, 218, 217, 217),
    colors.kPrimaryTextColor: Color.fromARGB(255, 218, 217, 217),
    colors.kSecondaryTextColor: Color.fromARGB(255, 218, 217, 217),
    colors.kNumpadTextColor: Color.fromARGB(255, 218, 217, 217),
    colors.kButtonRadius: 50.0
  };
  final Map<colors, Rx<Object>> settings =
      defaultSettings.map((key, value) => MapEntry(key, Rx(value)));
  Color get kPrimaryColor => settings[colors.kPrimaryColor]!.value as Color;
  Color get kSecondaryColor => settings[colors.kSecondaryColor]!.value as Color;
  Color get kThirdColor => settings[colors.kThirdColor]!.value as Color;
  Color get kNumPadColor => settings[colors.kNumPadColor]!.value as Color;
  Color get kBackgroundColor =>
      settings[colors.kBackgroundColor]!.value as Color;
  Color get kPrimaryTextColor =>
      settings[colors.kPrimaryTextColor]!.value as Color;
  Color get kSecondaryTextColor =>
      settings[colors.kSecondaryTextColor]!.value as Color;
  Color get kNumpadTextColor =>
      settings[colors.kNumpadTextColor]!.value as Color;
  double get kButtonRadius => settings[colors.kButtonRadius]!.value as double;
  Box get colorsLocalDB => LocalDBController.instance.colorsLocalDB;
  SettingsController();
  @override
  void onInit() {
    super.onInit();
    initializeSettings();
  }

  initializeSettings() {
    initializeColor(colors.kPrimaryColor);
    initializeColor(colors.kSecondaryColor);
    initializeColor(colors.kThirdColor);
    initializeColor(colors.kNumPadColor);
    initializeColor(colors.kBackgroundColor);
    initializeColor(colors.kPrimaryTextColor);
    initializeColor(colors.kSecondaryTextColor);
    initializeColor(colors.kNumpadTextColor);
    settings[colors.kButtonRadius]!.value =
        colorsLocalDB.get(colors.kButtonRadius.name) ??
            defaultSettings[colors.kButtonRadius];
  }

  initializeColor(colors setting) {
    final color = colorsLocalDB.get(setting.name);
    if (color != null) {
      settings[setting]!.value = Color(color);
    } else {
      settings[setting]!.value = defaultSettings[setting] as Color;
    }
  }

  modifyColor(colors changed) {
    Get.dialog(Material(
      child: AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: settings[changed]!.value as Color,
            onColorChanged: (color) {
              settings[changed]!.value = color;
            },
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Got it'),
            onPressed: () {
              colorsLocalDB.put(
                  changed.name, (settings[changed]!.value as Color).value);
              Get.back();
            },
          ),
        ],
      ),
    ));
  }

  reset() async {
    await colorsLocalDB.clear();
    initializeSettings();
  }

  Timer? _debounce;

  void modifyButtonRadius(value) {
    (settings[colors.kButtonRadius])!.value = value;
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      colorsLocalDB.put(colors.kButtonRadius.name, value);
    });
  }
}
