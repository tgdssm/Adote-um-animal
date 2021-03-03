import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_adoption_flutter_app/data/models/user.dart';
import 'package:pet_adoption_flutter_app/utils/globals.dart';

class Animal {
  String photo;
  String name;
  String breed;
  String sex;
  String species;
  int age;
  String description;
  String idDoc;
  String uid;

  Animal({this.photo, this.name, this.age, this.breed, this.sex, this.description, this.species});

  Animal.fromJson(QueryDocumentSnapshot snapshot){
    this.name = snapshot.data()['name'];
    this.breed = snapshot.data()['breed'];
    this.sex = snapshot.data()['sex'];
    this.age = snapshot.data()['age'];
    this.description = snapshot.data()['description'];
    this.photo = snapshot.data()['photo'];
    this.species = snapshot.data()['species'];
    this.idDoc = snapshot.id;
    this.uid = snapshot.data()['uid'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': this.name.toUpperCase(),
      'breed': this.breed.toUpperCase(),
      'sex': this.sex.toUpperCase(),
      'description': this.description.toUpperCase(),
      'age': this.age,
      'photo': this.photo,
      'species': this.species.toUpperCase(),
      'uid': authProvider.uid,
    };
  }
}