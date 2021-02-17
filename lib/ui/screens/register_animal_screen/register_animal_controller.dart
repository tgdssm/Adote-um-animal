import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_adoption_flutter_app/data/models/animal.dart';
import 'package:pet_adoption_flutter_app/data/providers/animal_provider.dart';

class RegisterAnimalController {
  File _image;
  String _urlImage;
  final _nameController = TextEditingController();
  final _breedController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ageController = TextEditingController();
  String _sex;
  final _formKey = GlobalKey<FormState>();
  final _animalProvider = AnimalProvider();
  final _picker = ImagePicker();

  Future<File> getImage() async{
    final PickedFile pickedFile = await _picker.getImage(source: ImageSource.gallery);
    this._image = File(pickedFile.path);
    print(_image);
    return _image;
  }

  Future<void> createAnimal() async{
    this._urlImage = await _animalProvider.uploadImage(_image);
    Animal animal = Animal(
      name: this._nameController.text,
      breed: this._breedController.text,
      description: this._descriptionController.text,
      sex: this._sex,
      age: int.tryParse(this._ageController.text),
      photo: this.urlImage,
    );
    await _animalProvider.create(animal);
  }

  String setSex(String sex) {
    this._sex = sex;
    return sex;
  }

  dynamic onPressingRegisterButton({BuildContext context}) {
    if(this._sex == null) {
      return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('YOU NEED TO CHOOSE THE SEX OF THE ANIMAL.'))
      );
    }
    if (this._formKey.currentState
        .validate()) {
      createAnimal();
      clearController();
      Navigator.pop(context);
      print('tudo certo');
    }
  }
  void clearController() {
    this._nameController.clear();
    this._descriptionController.clear();
    this._breedController.clear();
    this._ageController.clear();
  }
  File get image => _image;

  GlobalKey<FormState> get formKey => _formKey;

  String get urlImage => _urlImage;

  get animalProvider => _animalProvider;

  String get sex => _sex;

  get ageController => _ageController;

  get descriptionController => _descriptionController;

  get breedController => _breedController;

  get nameController => _nameController;
}