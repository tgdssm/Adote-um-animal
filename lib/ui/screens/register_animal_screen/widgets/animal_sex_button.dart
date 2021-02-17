import 'package:flutter/material.dart';

class AnimalSexButton extends StatefulWidget {
  final String sex;
  final void Function() onPressed;
  AnimalSexButton({this.sex, this.onPressed});
  @override
  _AnimalSexButtonState createState() => _AnimalSexButtonState();
}

class _AnimalSexButtonState extends State<AnimalSexButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: ImageIcon(
        AssetImage('assets/icons/${widget.sex}.png'), color: Colors.white, size: 60,),
      shape: CircleBorder(),
      color: Colors.black,
      onPressed: widget.onPressed,
    );
  }
}
