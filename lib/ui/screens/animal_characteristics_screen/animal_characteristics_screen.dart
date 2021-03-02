import 'package:flutter/material.dart';
import 'package:pet_adoption_flutter_app/data/models/animal.dart';
import 'package:pet_adoption_flutter_app/ui/screens/animal_characteristics_screen/widgets/alert_dialog_image.dart';
import 'package:pet_adoption_flutter_app/ui/screens/animal_characteristics_screen/widgets/characteristics_container.dart';

class AnimalCharacteristics extends StatelessWidget {
  final Animal animal;
  AnimalCharacteristics({this.animal});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialogImage(animal: animal);
                    },
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5 * 1.02,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    animal.photo,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 5.0,
                left: 5.0,
                child: IconButton(
                  icon: Icon(Icons.undo),
                  color: Colors.white,
                  iconSize: 30.0,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  height: MediaQuery.of(context).size.height * 0.3 * 1.7,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 25.0),
                          child: Text(
                            '${animal.name}, ${animal.age}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: 85.0,
                          child: Text(
                            animal.description,
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10.0)),
                        CharacteristicsContainer(
                          title: 'SEXO',
                          text: animal.sex,
                        ),
                        CharacteristicsContainer(
                          title: 'RAÇA',
                          text: animal.breed,
                        ),
                        CharacteristicsContainer(
                          title: 'IDADE',
                          text: animal.age.toString(),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 40.0),
                          width: MediaQuery.of(context).size.width,
                          height: 95,
                          child: RaisedButton(
                            onPressed: () {},
                            child: Text(
                              'ADOTAR',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




