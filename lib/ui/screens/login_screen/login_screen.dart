import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adoption_flutter_app/data/providers/google_geocoding.dart';
import 'package:pet_adoption_flutter_app/ui/screens/home_screen/home_screen.dart';
import 'package:pet_adoption_flutter_app/ui/screens/login_screen/login_controller.dart';
import 'package:pet_adoption_flutter_app/utils/globals.dart';

class LoginScreen extends StatelessWidget {
  final _loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/login_image.jpg',
                  fit: BoxFit.cover,
                )),
            Positioned(
              top: 80.0,
              left: 25.0,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  'ADOTE UM AMIGO',
                  style: TextStyle(fontSize: 55.0, color: Colors.white),
                ),
              ),
            ),
            Positioned(
              bottom: 25.0,
              left: MediaQuery.of(context).size.width * 0.1,
              // right: MediaQuery.of(context).size.width * 0.5,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30.0),
                        right: Radius.circular(30.0))),
                child: Obx(() => _loginController.load.value
                    ? CircularProgressIndicator()
                    : GestureDetector(
                        onTap: () async {
                          _loginController.load.value = true;
                          await Get.to(
                            HomeScreen(
                              user: await _loginController.login(),
                              userCurrentLocation: await GoogleGeocoding.reverseGeocoding(await userCurrentLocation),
                            ),
                          );
                          _loginController.load.value = false;
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Center(
                                  child: ImageIcon(
                                AssetImage('assets/icons/google.png'),
                                size: 35.0,
                              )),
                              Padding(padding: EdgeInsets.only(left: 5.0)),
                              Text(
                                'Sign In With Google',
                                style: TextStyle(
                                    fontSize: 25.0, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
