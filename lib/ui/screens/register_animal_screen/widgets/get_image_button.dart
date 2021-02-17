import 'dart:io';

import 'package:flutter/material.dart';

class GetImageButton extends StatefulWidget {
  final Future<File> Function() getImage;
  GetImageButton({this.getImage});
  @override
  _GetImageButtonState createState() => _GetImageButtonState();
}

class _GetImageButtonState extends State<GetImageButton> {
  File image;
  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Container(
          height: 150,
          width: 150,
          child: image == null
              ? RaisedButton(
            child: Icon(
              Icons.camera_alt_rounded,
              color: Colors.white,
              size: 60,
            ),
            shape: CircleBorder(),
            color: Colors.black,
            onPressed: () async {
              File temporaryImage =
              await widget.getImage();
              setState(() {
                image = temporaryImage;
              });
            },
          )
              : ClipRRect(
            borderRadius: BorderRadius.circular(80.0),
            child: Image.file(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
  }
}
