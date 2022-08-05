import 'package:calculator/contants.dart';
import 'package:calculator/modules/currency/API/CurrencyConvert.dart';
import 'package:calculator/modules/currency/models/exchange_rates.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class CurrencyController extends GetxController {
  RxString result = "".obs;
  late ConversionRates rates;
  Rx<double> amount = 0.0.obs;
  Rx<String> currency1 = 'INR'.obs;
  Rx<String> currency2 = 'USD'.obs;

  get exchangeRateLocalDB => LocalDBController.instance.exchangeRateLocalDB;
  @override
  onInit() async {
    await populateDBWithLatestRates();
    await getSavedRatesFromDB();
    super.onInit();
  }

  Future populateDBWithLatestRates() async {
    for (var url in CurrencyApi.getAllRates()) {
      final dateStr = exchangeRateLocalDB.get('date');
      bool doUpdate = false;
      if (dateStr != null) {
        final date = DateTime.parse(dateStr);
        if (DateTime.now().difference(date) > const Duration(days: 1)) {
          doUpdate = true;
        }
      } else {
        doUpdate = true;
      }
      if (doUpdate) {
        try {
          final rates = ExchangeRatesResponse.fromJson(
              json.decode((await http.get(Uri.parse(url))).body));
          exchangeRateLocalDB.put("date", DateTime.now().toString());
          exchangeRateLocalDB.put("rates", rates.conversionRates!.toJson());
          break;
        } catch (e) {
          continue;
        }
      }
    }
  }

  Future getSavedRatesFromDB() async {
    final ratesMap = await exchangeRateLocalDB.get("rates");
    rates = ConversionRates.fromJson(Map<String, dynamic>.from(ratesMap));
  }

  void exchangeRates() async {
    final currency1Rate = rates.exchangeRates[currency1]!;
    final currency2Rate = rates.exchangeRates[currency2]!;
    final excr = currency2Rate / currency1Rate;
    result.value = (excr * amount.value).toString();
  }
}
