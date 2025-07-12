import 'package:calculator/model/calculator_model.dart';
import 'package:calculator/viewModel/calculator_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClearButton extends StatelessWidget {
  ClearButton({super.key, required this.text});
  final String text;
  final CalculatorModel modelCalc = CalculatorModel();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CalculatorViewModel>(context);
    return SizedBox(
      width: 70,
      height: 70,
      
    child: FilledButton(
      
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.red[800]),
        backgroundColor: WidgetStatePropertyAll(Colors.blueGrey[900]),
        
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )
        )
      ),
      onPressed: (){
        
        provider.resetFields();
      }, 
      child: Text(
        text,
        style: TextStyle(
          fontSize: 30,

        ),
      ),
      ),
    );
  }
}