import 'package:calculator/model/calculator_model.dart';
import 'package:flutter/material.dart';

class CalculatorViewModel extends ChangeNotifier {
  var calcModel = CalculatorModel();

  String get operator => calcModel.operation;
  double get firstNum => calcModel.firstNum ?? 0.0;
  double get secondNum => calcModel.secondNum ?? 0.0;
  String get result => calcModel.result;
  String getActualNumber() => calcModel.textToDisplay;

  void setResult(String result) {
    calcModel.result = result;
    notifyListeners();
  }

  void setOperator(String operator) {
    if (calcModel.textToDisplay.isNotEmpty) {
      calcModel.firstNum = double.parse(calcModel.textToDisplay);
      calcModel.operation = operator;
      calcModel.textToDisplay = '0';  // Reinicia para el segundo número
      notifyListeners();
    }
  }
  void setFirstNum(num){
    calcModel.firstNum = num;
  }

  void changeScreenNumber(String text) {
    if (calcModel.textToDisplay == '0') {
      calcModel.textToDisplay = text;
    } else {
      calcModel.textToDisplay += text;
    }

    calculateResult(); // Se evalúa en tiempo real
    notifyListeners();
  }

  void deleteLastNumber() {
    var text = calcModel.textToDisplay;
    if (text.isNotEmpty && text != "0") {
      calcModel.textToDisplay = text.substring(0, text.length - 1);
    }
    if (calcModel.textToDisplay.isEmpty) {
      calcModel.textToDisplay = "0";
    }

    calculateResult();  // Se evalúa en tiempo real
    notifyListeners();
  }

  void clearNumberInput() {
    calcModel.clearScreen();
    
    notifyListeners();
  }

  void resetFields(){
    calcModel.clear();
    notifyListeners();
  }

  void calculateResult() {
    if (calcModel.firstNum != null && calcModel.textToDisplay.isNotEmpty) {
      calcModel.secondNum = double.tryParse(calcModel.textToDisplay) ?? 0.0;

      switch (calcModel.operation) {
        case "+":
          setResult((calcModel.firstNum! + calcModel.secondNum!).toString());
          break;
        case "-":
          setResult((calcModel.firstNum! - calcModel.secondNum!).toString());
          break;
        case "x":
          setResult((calcModel.firstNum! * calcModel.secondNum!).toString());
          break;
        case "÷":
          if (calcModel.secondNum! != 0) {
            setResult((calcModel.firstNum! / calcModel.secondNum!).toString());
          } 
        case "%":
          if (calcModel.firstNum != null && calcModel.secondNum != null){
            setResult((calcModel.firstNum! * (calcModel.secondNum! / 100)).toString());
          }  
          else {
            setResult("Error"); // Evitar división por cero
          }
          break;
      }

      notifyListeners();
    }
  }

}
