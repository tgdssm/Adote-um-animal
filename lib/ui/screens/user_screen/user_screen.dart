import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption_flutter_app/data/models/user.dart';
import 'package:pet_adoption_flutter_app/ui/screens/user_advertisement/user_advertisement_screen.dart';
import 'package:pet_adoption_flutter_app/ui/screens/user_screen/user_controller.dart';
import 'package:pet_adoption_flutter_app/ui/screens/user_screen/widgets/icons_row.dart';

class UserScreen extends StatelessWidget {
  final User _user = UserController().getCurrentUser();
  final _userController = UserController();
  final String position;
  UserScreen({this.position});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 450,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(45.0),
                          bottomLeft: Radius.circular(45.0),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 130.0, left: 10.0, right: 10.0),
                          alignment: Alignment.bottomCenter,
                          color: Colors.black,
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text('3',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0)),
                                  Text(
                                    'PUBLICAÇÕES',
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text('3',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0)),
                                  Text(
                                    'CURTIDAS',
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text('3',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0)),
                                  Text(
                                    'FAVORITOS',
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(45.0),
                        bottomLeft: Radius.circular(45.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 35.0),
                        height: 350,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              child: ClipRRect(
                                child: Image.network(
                                  _user.photoUrl,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(95.0),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Column(
                                children: [
                                  Text(
                                    _userController
                                        .replaceName(_user.displayName),
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '$position',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  children: [
                    IconsRow(
                      title1: 'MINHAS PUBLICAÇÕES',
                      icon1: ImageIcon(
                        AssetImage('assets/icons/advertisement.png'),
                        size: 50,
                      ),
                      screen1: UserAdvertisementScreen(),
                      title2: 'MEUS FAVORITOS',
                      icon2: Icon(
                        Icons.favorite,
                        size: 50,
                      ),
                    ),
                    Spacer(),
                    IconsRow(
                      title1: 'MINHA LOCALIZAÇÃO',
                      icon1: Icon(
                        Icons.add_location,
                        size: 50,
                      ),
                      title2: 'NOTIFICAÇÕES',
                      icon2: Icon(
                        Icons.notifications,
                        size: 50,
                      ),
                      widthSizedBox: 45.0,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
