import 'package:calculator/model/calculator_model.dart';
import 'package:calculator/viewModel/calculator_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ResultButton extends StatelessWidget {
  ResultButton({super.key, required this.text});
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
        backgroundColor: WidgetStatePropertyAll(Colors.green),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )
        )
      ),
      onPressed: (){
        var tNum = provider.result;
        provider.resetFields();
        provider.setFirstNum(double.parse(tNum));
        provider.changeScreenNumber(tNum);
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