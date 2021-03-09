import 'package:flutter/material.dart';
import 'package:pet_adoption_flutter_app/data/models/animal.dart';
import 'package:pet_adoption_flutter_app/data/models/user.dart';
import 'package:pet_adoption_flutter_app/ui/screens/animal_characteristics_screen/animal_characteristics_screen.dart';
import 'package:pet_adoption_flutter_app/utils/globals.dart';

class AnimalList extends StatelessWidget {
  final List<Animal> animals;
  AnimalList({this.animals});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            itemCount: animals.length,
            itemBuilder: (context, index) {
              final animal = animals[index];
              return ListTile(
                title: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnimalCharacteristics(
                          animal: animal,
                          user: User.fromJson(authProvider),
                        ),
                      )),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60.0),
                            child: Image.network(
                              animal.photo,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 25.0,
                        ),
                        Container(
                          width: 195,
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                  child: Text(
                                animal.name,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              )),
                              Container(
                                  child: Text(animal.species,
                                      style: TextStyle(fontSize: 18.0))),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
