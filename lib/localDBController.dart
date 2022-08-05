import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LocalDBController extends GetxController {
  late Box exchangeRateLocalDB;
  late Box colorsLocalDB;

  static LocalDBController instance = Get.find();
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> intializeLocalDB() async {
    Hive.init((await getApplicationDocumentsDirectory()).path);
    exchangeRateLocalDB = await Hive.openBox('exchange_rates');
    colorsLocalDB = await Hive.openBox('colors');
  }
}
