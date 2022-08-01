import 'package:get/get.dart';

class CalculatorController extends GetxController {
  Rx<num?> num1 = Rx(null);
  Rx<num?> num2 = Rx(null);
  RxString result = ''.obs;
  RxString operation = ''.obs;
  RxString textToDisplay = ''.obs;
  RxString history = ''.obs;
  var tmp = ''.obs;

  void buttonOnClick(input) {
    if (input == 'C') {
      num1.value = null;
      num2.value = null;
      result.value = '';
      operation.value = '';
      textToDisplay.value = '0';
      history.value = '';
      tmp.value = '';
      return;
    }
    void giveResult() {
      if (operation.value == '+') {
        result.value = (num1.value! + num2.value!).toString();
      } else if (operation.value == '-') {
        result.value = (num1.value! - num2.value!).toString();
      } else if (operation.value == '\u0078') {
        result.value = (num1.value! * num2.value!).toString();
      } else if (operation.value == '÷') {
        result.value = (num1.value! / num2.value!).toString();
      }
      return;
    }

    void giveTmpResult() {
      if (operation.value == '+') {
        result.value = (num1.value! + num.parse(tmp.value)).toString();
      } else if (operation.value == '-') {
        result.value = (num1.value! - num.parse(tmp.value)).toString();
      } else if (operation.value == '\u0078') {
        result.value = (num1.value! * num.parse(tmp.value)).toString();
      } else if (operation.value == '÷') {
        result.value = (num1.value! / num.parse(tmp.value)).toString();
      }
      return;
    }

    if (input == '+' || input == '-' || input == '÷' || input == '\u0078') {
      operation.value = input;
      num1.value = num.parse(tmp.value);
      tmp.value = '';
      textToDisplay.value = '${num1.value} ${operation.value}';
      history.value = '${num1.value} ${operation.value}';
      return;
    } else if (input == '=' && num1.value != null) {
      num2.value = num.parse(tmp.value);
      giveResult();
      textToDisplay.value = result.value;
      history.value =
          '${num1.value} ${operation.value} ${num2.value} = ${result.value}';
      tmp.value = result.value;
      num1.value = null;
      num2.value = null;

      return;
    } else if (num1.value == null && input != '=') {
      tmp.value += input;
      textToDisplay.value = tmp.value.toString();
      history.value = tmp.value.toString();
      return;
    } else if (num1.value != null && input != '=') {
      tmp.value += input;
      history.value = '${num1.value} ${operation.value} ${tmp.value}';
      textToDisplay.value = '${num1.value} ${operation.value} ${tmp.value}';
      return;
    } else if ((input == '+' && num1.value != null && tmp.value != '') ||
        (input == '-' && num1.value != null && tmp.value != '') ||
        (input == '÷' && num1.value != null && tmp.value != '') ||
        (input == '\u0078' && num1.value != null && tmp.value != '')) {
      giveTmpResult();
      num1.value = num.parse(result.value);
      textToDisplay.value = num1.toString();
      result.value = "";
    }
  }
}
