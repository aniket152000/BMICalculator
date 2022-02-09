import 'package:bmi_calculator/calculatorbrain.dart';

import 'reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'results_page.dart';
import 'RoundIconbutton.dart';
import 'ButtomButton.dart';
import 'results_page.dart';

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State {
  Gender selectedgender;
  int height=180;
  int weight=30;
  int age=10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    onpress:(){
                      setState(() {
                        selectedgender=Gender.male;
                      });
                    },
                    colour: selectedgender==Gender.male?kactiveCardColor:kinactiveCardColor,
                    cardchild: IconContent(
                      icons: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onpress: (){
                      setState(() {
                        selectedgender=Gender.female;
                      });
                    },
                    colour: selectedgender==Gender.female?kactiveCardColor:kinactiveCardColor,
                    cardchild: IconContent(
                      icons: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child:  ReuseableCard(
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: klabelstyletext,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style:kNumbertextstyle,
                            ),
                            Text('cms',
                              style: klabelstyletext,),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            overlayColor: Color(0x29D20138),
                            activeTrackColor: Colors.pink,
                            thumbColor: Colors.pink,
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max:220.0,
                            inactiveColor: Color(0xFF21223A),
                            onChanged: (double newvalue){
                              setState(() {
                                height=newvalue.round();
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                    colour: kactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child:  ReuseableCard(
                    colour: kactiveCardColor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style:klabelstyletext ,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumbertextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon:FontAwesomeIcons.minus,
                            onpressed:(){
                              setState(() {
                                weight--;
                              });
                            },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                            onpressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child:  ReuseableCard(
                    colour: kactiveCardColor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style:klabelstyletext ,
                        ),
                        Text(
                          age.toString(),
                          style: kNumbertextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon:FontAwesomeIcons.minus,
                              onpressed:(){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                              onpressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: (){
              calculatorbrain calc = calculatorbrain(height: height,weight: weight);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                    ResultPage(
                      bmiResult: calc.calculatebmi(),
                      resultText: calc.bmiresult(),
                      interpretation: calc.getInterpretation(),

                    ),
                ),
            );
          },
          )
        ],
      ),
    );
  }
}





