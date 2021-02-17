import 'package:flutter/material.dart';

class AnimalContainer extends StatelessWidget {
  final String animal;
  AnimalContainer({this.animal});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: GestureDetector(
        child: Container(
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.black),
          ),
          child: ImageIcon(AssetImage('assets/icons/$animal.png'), size: 40.0,),
        ),
        onTap: () => print('tocou no $animal'),
      ),
    );
  }
}
