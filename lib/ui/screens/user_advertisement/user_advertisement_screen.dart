import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_adoption_flutter_app/data/models/animal.dart';
import 'package:pet_adoption_flutter_app/ui/screens/user_advertisement/user_advertisement_controller.dart';
import 'package:pet_adoption_flutter_app/ui/screens/user_advertisement/widgets/animal_list.dart';

class UserAdvertisementScreen extends StatelessWidget {
  final _userAdvertisementController = UserAdvertisementController();
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
          'MEUS ANÚNCIOS',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: FutureBuilder<List<Animal>>(
            future: _userAdvertisementController.readByUserId(),
            builder: (context, snapshot) {
              switch(snapshot.connectionState) {
                case ConnectionState.waiting :
                  return Center(child: CircularProgressIndicator(),);
                  break;
                case ConnectionState.none :
                  return Center(child: Text('NENHUM ANÚNCIO ENCONTRADO'),);
                  break;
                case ConnectionState.active :
                  return Center(child: CircularProgressIndicator(),);
                  break;
                default :
                  return AnimalList(animals: snapshot.data);
              }
            },
          ),
        ),
      ),
    );
  }
}
