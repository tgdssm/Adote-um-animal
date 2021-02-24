import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_adoption_flutter_app/data/models/animal.dart';
import 'package:pet_adoption_flutter_app/data/providers/animal_provider.dart';

class HomeController {
  final _animalProvider = AnimalProvider();
  Future<List<Animal>> read() async{
    return await this._animalProvider.read();
  }

  // Stream<QuerySnapshot> read() {
  //   return this._animalProvider.read();
  // }
}