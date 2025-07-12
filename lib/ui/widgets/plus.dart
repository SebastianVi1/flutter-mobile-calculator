import 'package:calculator/model/calculator_model.dart';
import 'package:calculator/viewModel/calculator_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PlusButton extends StatelessWidget {
  PlusButton({super.key, required this.text});
  final String text;
  CalculatorModel calcModel = CalculatorModel();


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CalculatorViewModel>(context);
    return SizedBox(
      width: 70,
      height: 70,
      
    child: FilledButton(
      
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.green[800]),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )
        )
      ),
      onPressed: (){
        var actualText = provider.getActualNumber();
         if (actualText.isNotEmpty){
          double num = double.parse(actualText);
          
          provider.setFirstNum(num);
          provider.setOperator('+');
          provider.clearNumberInput();
          
         }
         
          
      }
        
      , 
      child: Text(
        text,
        style: TextStyle(
          fontSize: 26,

        ),
      ),
      ),
    );
  }
}