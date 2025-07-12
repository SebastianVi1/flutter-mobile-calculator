class CalculatorModel {
  double? firstNum;
  double? secondNum;
  String result = '';
  String textToDisplay = '0';

  String operation = '';

  void clear() {
    firstNum = null;
    secondNum = null;
    textToDisplay = "0";
    operation = "";
    result = '';
    
  }
  void clearScreen(){
    textToDisplay = "0";
    result ='';
    
  }
}