import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onpressed});
  final IconData icon;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpressed,
      elevation: 5.0,
      constraints:BoxConstraints.tightFor(
        height: 50.0,
        width: 50.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF21223A),
    );
  }
}