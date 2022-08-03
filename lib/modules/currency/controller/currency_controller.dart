import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyController extends GetxController {
  @override


  final TextEditingController resultController = TextEditingController();
  Rx<double> amount = 0.0.obs;
  Rx<String> currency1 = 'INR'.obs;
  Rx<String> currency2 = 'USD'.obs;
  Future apicall() async {
    http.Response response;
    response = await http.get(
        Uri.parse(
            "https://api.apilayer.com/exchangerates_data/convert?to=${currency2.value}&from=${currency1.value}&amount=${amount.value}"),
        headers: {"apikey": "4R9ImZX8DUkEiLnmpRvDAxMPhiWmeL5b"});
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      resultController.text = jsonData['result'].toString();
    } else if (response.statusCode == 400) {
      resultController.text = "0";
    } else {
      resultController.text = "0";
    }
  }
}
