import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'ButtomButton.dart';
import 'calculatorbrain.dart';
class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.interpretation,
        @required this.bmiResult,
        @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child:
              Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: ktitletextstyle,
                ),
              ),
          ),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              colour: kactiveCardColor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText,
                    style: kResultextstyle,
                  ),
                  Text(
                    bmiResult
                    ,style: kBMIStyle,
                  ),
                  Text(
                    interpretation
                    ,style: kBodytextstyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(buttonTitle: 'RE-CALCULATE',
          onTap: (){
            Navigator.pop(context);
          },
          ),
        ],
      ),
    );
  }
}

