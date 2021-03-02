import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimalFormField extends StatelessWidget {
  final String fieldName;
  final TextEditingController controller;
  final void Function(String) validator;
  final TextInputType textInputType;
  final List<TextInputFormatter> inputFormatters;
  final int maxLines;
  final int maxLength;
  AnimalFormField({
    this.fieldName,
    this.controller,
    this.validator,
    this.textInputType,
    this.inputFormatters,
    this.maxLines = 1,
    this.maxLength = 30,
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
            maxLines: maxLines,
            maxLength: maxLength,
            inputFormatters: inputFormatters == null ? [] : inputFormatters,
            keyboardType: this.textInputType == null ? TextInputType.multiline :
            textInputType,
            controller: this.controller,
            cursorColor: Colors.black,
            style: TextStyle(
              fontSize: 20.0
            ),
            validator: this.validator == null ? (value) {
              if(value.isEmpty || value.indexOf(' ') == 0){
                return 'THE FIELD NO ${this.fieldName} CAN BE EMPTY';
              }
              return null;
            } : this.validator,
          ),
        ],
      ),
    );
  }
}