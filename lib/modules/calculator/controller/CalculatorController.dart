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
  RxString history = ''.obs;
  calc() {
    final lex = Lexer();
    Expression exp =
        parseTokenAndAppendToExpression(lex.tokenizeToRPN(equation.value));
    ContextModel cm = ContextModel();
    double res = exp.evaluate(EvaluationType.REAL, cm);
    equation.value = res.toString();
    textToDisplay.value = equation.value;
  }

  void buttonOnClick(input) {
    if (input != 'C' && input != '⌫' && input != '=') {
      equation.value += input;
      textToDisplay.value = equation.value;
    }
    if (equation.value.isEmpty) {
      history.value = equation.value;
    }
    if (equation.value.isNotEmpty) {
      history.value = equation.value;
    }

    if (input == 'C') {
      equation.value = '';
      textToDisplay.value = '0';
      history.value = '';
    }
    if (input == '⌫') {
      if (equation.value.isNotEmpty && equation.value.length > 1) {
        equation.value = equation.value.substring(0, equation.value.length - 1);
        textToDisplay.value = equation.value;
        history.value = equation.value;
      } else if (equation.value.length == 1 || equation.value.isEmpty) {
        textToDisplay.value = '0';
        history.value = '';
        equation.value = '';
      }
    }
    if (input == '=') {
      calc();
    }
  }
}
