import 'package:flutter/material.dart';

class AnimalFormField extends StatelessWidget {
  final String fieldName;
  final TextEditingController controller;
  AnimalFormField({
    this.fieldName,
    this.controller,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(bottom: 3.0),
            child: Text(this.fieldName, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),),
          ),
          TextFormField(
            controller: this.controller,
            cursorColor: Colors.black,
            style: TextStyle(
              fontSize: 20.0
            ),
            validator: (value) {
              if(value.isEmpty || value.indexOf(' ') == 0){
                return 'THE FIELD NO ${this.fieldName} CAN BE EMPTY';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}