import 'package:get/get.dart';

class CalculatorController extends GetxController {
  Rx<List<String?>> equation = Rx([]);
  // Rx<num?> num1 = Rx(null);
  // Rx<num?> num2 = Rx(null);
  // RxString result = ''.obs;
  RxString operation = ''.obs;
  RxString textToDisplay = ''.obs;
  RxString history = ''.obs;

  void buttonOnClick(input) {
    void calc() {
      num temporary = 0.0;
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
    }
    if (input == 'C') {
      equation.value.clear();
      textToDisplay.value = '0';
      history.value = '';
    }
    if (input == '⌫') {
      if (equation.value.isNotEmpty) {
        equation.value.removeLast();
        textToDisplay.value = equation.value.last!;
        history.value = equation.value.join(' ');
      } else if (equation.value.length == 1 || equation.value.isEmpty) {
        textToDisplay.value = '0';
        history.value = '';
        
      }
    }
  }
}
