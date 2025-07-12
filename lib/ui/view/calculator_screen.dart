import 'package:calculator/viewModel/calculator_view_model.dart';
import 'package:calculator/ui/widgets/clear_input.dart';
import 'package:calculator/ui/widgets/delete_number.dart';
import 'package:calculator/ui/widgets/divide_button.dart';
import 'package:calculator/ui/widgets/minus_button.dart';
import 'package:calculator/ui/widgets/multiply_button.dart';
import 'package:calculator/ui/widgets/number_button.dart';
import 'package:calculator/ui/widgets/plus.dart';
import 'package:calculator/ui/widgets/porcentage_button.dart';
import 'package:calculator/ui/widgets/result_button.dart';
import 'package:calculator/viewModel/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}
class _CalculatorScreenState extends State<CalculatorScreen> {

  @override
  Widget build(BuildContext context) {

    var modelCalc = Provider.of<CalculatorViewModel>(context);
    return Scaffold(

      // appBar: AppBar(
      //   title: Text('Calculator'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            
                            Text(
                              'Calculator',
                              textAlign: TextAlign.start,
                              
                              style: TextStyle(
                                
                              fontSize: 30,
                                
                              ),
                            ),
                            
                           Consumer<ThemeProvider>(
                            builder: (context, themeProvider, child) {
                              return Switch(
                                thumbColor: WidgetStatePropertyAll(Colors.white),
                                activeTrackColor: Colors.red,
                                value: themeProvider.themeMode == ThemeMode.dark,
                                onChanged: (_)=> themeProvider.toggleTheme(),
                              );
                            },
                           )
                          ],
                        ),
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment(0.8, 1),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            
                            Text(
                              modelCalc.getActualNumber(),
                              style: TextStyle(
                                fontSize: 28,
                              ),
                              
                            ),
                            SizedBox(width: 10,),
                            Text(modelCalc.operator)
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          modelCalc.result,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.blueGrey,
                          ),
                        ),
                        
                      ],
                    ),
                ),
              ),
              Divider(thickness: 2,height: 40,),
              Flexible(
                flex: 3,
                child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClearButton(text: 'C'),
                          DeleteButton(text: 'D'),
                          PorcentageButton(text: '%'),
                          DivideButton(text: '÷'),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NumberButton(text: '7'),
                          NumberButton(text: '8'),
                          NumberButton(text: '9'),
                          MultiplyButton(text: 'x'),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NumberButton(text: '4'),
                          NumberButton(text: '5'),
                          NumberButton(text: '6'),
                          MinusButton(text: '-'),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NumberButton(text: '1'),
                          NumberButton(text: '2'),
                          NumberButton(text: '3'),
                          PlusButton(text: '+'),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NumberButton(text: '-'),
                          NumberButton(text: '0'),
                          NumberButton(text: '.'),
                          ResultButton(text: '='),
                        ],
                      ),
                    ],
                  ),
              ),


            ],
          ),

        ),
      ),
    );
  }
}