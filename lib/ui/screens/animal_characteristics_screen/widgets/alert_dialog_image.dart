import 'package:flutter/material.dart';
import 'package:pet_adoption_flutter_app/data/models/animal.dart';

class AlertDialogImage extends StatelessWidget {
  const AlertDialogImage({
    Key key,
    @required this.animal,
  }) : super(key: key);

  final Animal animal;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)
      ),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        child: Image.network(
          animal.urlPhoto,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}