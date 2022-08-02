import 'package:get/get.dart';

class CalculatorController extends GetxController {
  Rx<List<String?>> equation = Rx([]);
  // Rx<num?> num1 = Rx(null);
  // Rx<num?> num2 = Rx(null);
  // RxString result = ''.obs;
  RxString operation = ''.obs;
  RxString textToDisplay = ''.obs;
  RxString history = ''.obs;
  var tmp = ''.obs;

  void buttonOnClick(input) {
    num temporary = 0.0;
    void calc() {
      for (var element = 0; element < equation.value.length; element++) {
        switch (equation.value[element]) {
          case "+":
            {
              temporary += num.parse(equation.value[element - 1]!) +
                  num.parse(equation.value[element + 1]!);
            }
            break;
          case "-":
            {
              temporary += num.parse(equation.value[element - 1]!) -
                  num.parse(equation.value[element + 1]!);
            }
            break;
          case '\u0078':
            {
              temporary += num.parse(equation.value[element - 1]!) *
                  num.parse(equation.value[element + 1]!);
            }
            break;

          case "÷":
            {
              temporary += num.parse(equation.value[element - 1]!) /
                  num.parse(equation.value[element + 1]!);
            }
            break;
        }
      }
    }

    if (input != 'C' && input != '⌫') {
      equation.value.add(input);
      textToDisplay.value = input;
      history.value = equation.value.join(' ');
      tmp.value = textToDisplay.value;
    } else if (input == 'C') {
      equation.value = [];
      textToDisplay.value = '0';
      history.value = '';
      tmp.value = '';
    } else if (input == '⌫') {
      if (equation.value.isNotEmpty) {
        equation.value.removeLast();
        textToDisplay.value = equation.value.last!;
        tmp.value = textToDisplay.value;
      }
    } else if (input == '=') {
      calc();
      textToDisplay.value = temporary.toString();
    }
    if (input == 'C') {
      equation.value = [];
      // num1.value = null;
      // num2.value = null;
      // result.value = '';
      operation.value = '';
      textToDisplay.value = '0';
      history.value = '';
      temporary = 0;
      return;
    }
  }
}
