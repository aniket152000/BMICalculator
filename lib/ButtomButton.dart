import 'package:flutter/material.dart';
import 'constants.dart';
import 'input_page.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap,@required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargebuttonTextStyle,
          ),
        ),
        color: kbottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: KbottomContainerHeight,
      ),
    );
  }
}