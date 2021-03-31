import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pet_adoption_flutter_app/ui/screens/register_animal_screen/register_animal_controller.dart';
import 'package:pet_adoption_flutter_app/ui/screens/register_animal_screen/widgets/animal_form_field.dart';
import 'package:pet_adoption_flutter_app/ui/screens/register_animal_screen/widgets/animal_sex_button.dart';
import 'package:pet_adoption_flutter_app/ui/screens/register_animal_screen/widgets/get_image_button.dart';

class RegisterAnimalScreen extends StatefulWidget {
  final animal;
  final String city;
  RegisterAnimalScreen({this.animal, this.city});

  @override
  _RegisterAnimalScreenState createState() => _RegisterAnimalScreenState();
}

class _RegisterAnimalScreenState extends State<RegisterAnimalScreen> {
  final _registerAnimalController = Get.put(RegisterAnimalController());

  Future<File> getImage() async {
    return await _registerAnimalController.getImage();
  }

  @override
  initState() {
    super.initState();
    if (widget.animal != null)
      _registerAnimalController.setValues(widget.animal);
  }

  DropdownButton<String> _dropdownButton() {
    return DropdownButton<String>(
      isExpanded: true,
      underline: Container(
        height: 1,
        color: Colors.grey,
      ),
      hint: _registerAnimalController.dropdownValue == null
          ? Text(
              'SELECIONAR ESPÉCIE',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            )
          : Text(
              _registerAnimalController.dropdownValue,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
      value: _registerAnimalController.dropdownValue,
      onChanged: (String newValue) {
        setState(() {
          _registerAnimalController.dropdownValue = newValue;
        });
      },
      items: _registerAnimalController.species.map((e) {
        return DropdownMenuItem<String>(
          value: e,
          child: Text(
            e,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
          ),
        );
      }).toList(),
    );
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
          'REGISTRAR PET',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                GetImageButton(getImage: getImage),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(bottom: 3.0, left: 40.0),
                  child: Text(
                    'ESPÉCIE',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
                    child: _dropdownButton()),
                Form(
                  key: _registerAnimalController.formKey,
                  child: Column(
                    children: [
                      AnimalFormField(
                        fieldName: 'NOME',
                        maxLength: 20,
                        controller: _registerAnimalController.nameController,
                      ),
                      AnimalFormField(
                        fieldName: 'RAÇA',
                        controller: _registerAnimalController.breedController,
                      ),
                      AnimalFormField(
                        fieldName: 'IDADE',
                        validator: (value) {
                          if (value.isEmpty || value == '0')
                            return 'THE FIELD NO AGE CAN BE EMPTY';
                          return null;
                        },
                        maxLength: 2,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                        ],
                        textInputType: TextInputType.number,
                        controller: _registerAnimalController.ageController,
                      ),
                      AnimalFormField(
                        fieldName: 'DESCRIÇÃO',
                        maxLines: null,
                        maxLength: 120,
                        controller:
                            _registerAnimalController.descriptionController,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 40.0),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(bottom: 3.0),
                              child: Text(
                                'SEXO',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AnimalSexButton(
                                  sex: 'male',
                                  onPressed: () =>
                                      _registerAnimalController.setSex('MACHO'),
                                ),
                                AnimalSexButton(
                                  sex: 'female',
                                  onPressed: () =>
                                      _registerAnimalController.setSex('FÊMEA'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Obx(() => _registerAnimalController.loading.value
                          ? Container(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 40.0),
                              width: MediaQuery.of(context).size.width,
                              height: 95,
                              child: MaterialButton(
                                onPressed: () {
                                  _registerAnimalController
                                      .onPressingRegisterButton(
                                          context: context,
                                          animal: widget.animal,
                                          city: widget.city);
                                },
                                child: Text(
                                  'REGISTRAR',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                              ),
                            )),
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
