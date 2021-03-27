import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_adoption_flutter_app/utils/globals.dart';

class Animal {
  String urlPhoto;
  String name;
  String breed;
  String sex;
  String species;
  int age;
  String description;
  String idDoc;
  String uid;
  DateTime date;
  String imageFileName;
  Animal(
      {this.urlPhoto,
      this.name,
      this.age,
      this.breed,
      this.sex,
      this.description,
      this.species,
      this.imageFileName});

  Animal.fromJson(QueryDocumentSnapshot snapshot) {
    this.name = snapshot.data()['name'];
    this.breed = snapshot.data()['breed'];
    this.sex = snapshot.data()['sex'];
    this.age = snapshot.data()['age'];
    this.description = snapshot.data()['description'];
    this.urlPhoto = snapshot.data()['photo'];
    this.species = snapshot.data()['species'];
    this.idDoc = snapshot.id;
    this.uid = snapshot.data()['uid'];
    this.imageFileName = snapshot.data()['imageFileName'];
    // this.date = snapshot.data()['date'].toDate() ?? null;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': this.name.toUpperCase(),
      'breed': this.breed.toUpperCase(),
      'sex': this.sex.toUpperCase(),
      'description': this.description.toUpperCase(),
      'age': this.age,
      'photo': this.urlPhoto,
      'species': this.species.toUpperCase(),
      'uid': authProvider.uid,
      'date': DateTime.now(),
      'imageFileName': this.imageFileName
    };
  }
}
