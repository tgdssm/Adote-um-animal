import 'package:flutter/material.dart';
import 'package:pet_adoption_flutter_app/data/models/user.dart';
import 'package:pet_adoption_flutter_app/ui/screens/login_screen/login_screen.dart';

class AppBarCustom extends StatelessWidget {
  final User user;
  final VoidCallback voidCallback;
  AppBarCustom({
    Key key,
    this.user,
    this.voidCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              icon: Icon(
                Icons.menu_outlined,
                size: 30.0,
              ),
              onPressed: () {}),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(30.0)),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Center(
              child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                      hintStyle: TextStyle(
                        fontSize: 18.0,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Theme.of(context).primaryColor)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ))),
            ),
          ),
          GestureDetector(
            onTap: (){
              voidCallback();
              Navigator.pop(context);
            },
            child: Container(
              height: 50,
              width: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80.0),
                child: Image.network(
                  user.photoUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}