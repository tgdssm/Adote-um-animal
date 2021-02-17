import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pet_adoption_flutter_app/ui/screens/register_animal_screen/register_animal_controller.dart';
import 'package:pet_adoption_flutter_app/ui/screens/register_animal_screen/widgets/animal_form_field.dart';
import 'package:pet_adoption_flutter_app/ui/screens/register_animal_screen/widgets/animal_sex_button.dart';
import 'package:pet_adoption_flutter_app/ui/screens/register_animal_screen/widgets/get_image_button.dart';

class RegisterAnimalScreen extends StatelessWidget {
  final _registerAnimalController = RegisterAnimalController();
  Future<File> getImage() async {
    return await _registerAnimalController.getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.undo),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'REGISTER PET',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                GetImageButton(getImage: getImage),
                Form(
                  key: _registerAnimalController.formKey,
                  child: Column(
                    children: [
                      AnimalFormField(
                        fieldName: 'NAME',
                        controller: _registerAnimalController.nameController,
                      ),
                      AnimalFormField(
                        fieldName: 'BREED',
                        controller: _registerAnimalController.breedController,
                      ),
                      AnimalFormField(
                        fieldName: 'AGE',
                        controller: _registerAnimalController.ageController,
                      ),
                      AnimalFormField(
                        fieldName: 'DESCRIPTION',
                        controller:
                            _registerAnimalController.descriptionController,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.only(bottom: 3.0),
                              child: Text('SEX', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AnimalSexButton(sex: 'male', onPressed: () => _registerAnimalController.setSex('M'),),
                                AnimalSexButton(sex: 'female', onPressed: () => _registerAnimalController.setSex('F'),),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 40.0),
                        width: MediaQuery.of(context).size.width,
                        height: 95,
                        child: RaisedButton(
                          onPressed: () {
                            _registerAnimalController.onPressingRegisterButton();
                          },
                          child: Text(
                            'REGISTER',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
