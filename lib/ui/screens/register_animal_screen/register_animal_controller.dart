import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_adoption_flutter_app/data/models/animal.dart';
import 'package:pet_adoption_flutter_app/data/providers/animal_provider.dart';
import 'package:pet_adoption_flutter_app/ui/screens/home_screen/home_screen.dart';

class RegisterAnimalController {
  File _image;
  String _urlImage;
  String _loading;
  final _nameController = TextEditingController();
  final _breedController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ageController = TextEditingController();
  String _sex;
  final _formKey = GlobalKey<FormState>();
  final _animalProvider = AnimalProvider();
  List<String> _species = ['GATO', 'CACHORRO'];
  String _dropdownValue;

  void setValues(Animal animal) {
    this._nameController.text = animal.name;
    this._ageController.text = animal.age.toString();
    this._dropdownValue = animal.species;
    this._breedController.text = animal.breed;
    this._descriptionController.text = animal.description;
    this._sex = animal.sex;
  }

  Future<File> getImage() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      this._image = File(result.files.single.path);
    }
    return this._image;
  }

  Future<void> deleteImage(Animal animal) async {
    await _animalProvider.deleteImage(animal.photo.substring(77, 80));
  }

  Future<void> createUpdateAnimal({Animal animalId}) async {
    if (this._image != null) {
      this._urlImage = await _animalProvider.uploadImage(_image);
      await deleteImage(animalId);
    }

    Animal animal = Animal(
      name: this._nameController.text,
      breed: this._breedController.text,
      description: this._descriptionController.text,
      sex: this._sex,
      age: int.tryParse(this._ageController.text),
      species: this._dropdownValue,
      photo: this._urlImage != null ? this._urlImage : animalId.photo,
    );
    if (animalId == null)
      await _animalProvider.create(animal);
    else
      await _animalProvider.update(animal, animalId.idDoc);
    clearController();
  }

  String setSex(String sex) {
    this._sex = sex;
    return sex;
  }

  dynamic onPressingRegisterButton(
      {BuildContext context, Animal animal}) async {
    if (this._formKey.currentState.validate()) {
      if (this._image == null && animal == null) {
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('YOU NEED TO CHOOSE ANIMAL PHOTO.'),
        ));
      }
      if (this._dropdownValue == null) {
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('YOU NEED TO CHOOSE THE ANIMAL SPECIES.'),
        ));
      }
      if (this._sex == null) {
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('YOU NEED TO CHOOSE THE SEX OF THE ANIMAL.')));
      }
      createUpdateAnimal(animalId: animal);
      Navigator.pop(context);
      print('tudo certo');
    }
  }

  void clearController() {
    this._nameController.clear();
    this._descriptionController.clear();
    this._breedController.clear();
    this._ageController.clear();
    this._dropdownValue = null;
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

  List<String> get species => _species;

  String get dropdownValue => _dropdownValue;

  set dropdownValue(String value) {
    _dropdownValue = value;
  }
}
