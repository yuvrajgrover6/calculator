import 'package:calculator/modules/calculator/utils/modified_math_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Rx<String> equation = ''.obs;
  // Rx<String> temp = ''.obs;
  // Rx<num?> num2 = Rx(null);
  // RxString result = ''.obs;
  RxString operation = ''.obs;
  RxString textToDisplay = ''.obs;
  calc() {
    final lex = Lexer();
    Expression exp =
        parseTokenAndAppendToExpression(lex.tokenizeToRPN(equation.value));
    ContextModel cm = ContextModel();

    var res = exp.evaluate(EvaluationType.REAL, cm);
    try {
      if (int.parse(res.toString().split(".")[1]) == 0) {
        res = int.parse((res as double).toStringAsFixed(0));
      }
      textToDisplay.value = res.toString();
    } catch (e) {
      textToDisplay.value = res.toString();
    }
    return res;
  }

  void buttonOnClick(input) {
    if (input != 'C' && input != '⌫' && input != '=') {
      equation.value += input;
    }
    if (input == 'C') {
      equation.value = '';
      textToDisplay.value = '';
    }
    if (input == '⌫') {
      if (equation.value.isNotEmpty && equation.value.length > 1) {
        equation.value = equation.value.substring(0, equation.value.length - 1);
      } else if (equation.value.length == 1 || equation.value.isEmpty) {
        textToDisplay.value = '0';
        equation.value = '';
      }
    }
    if (input == '=') {
      equation.value = calc().toString();
      return;
    }
    try {
      calc();
    } catch (e) {
      ; // NOTE: doesn't matter
    }
  }
}
