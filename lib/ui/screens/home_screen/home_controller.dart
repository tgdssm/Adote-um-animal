import 'package:pet_adoption_flutter_app/data/models/animal.dart';
import 'package:pet_adoption_flutter_app/data/providers/animal_provider.dart';

class HomeController {
  final _animalProvider = AnimalProvider();
  Future<List<Animal>> read({String filter}) async{
    return await this._animalProvider.read(filter: filter);
  }

  // Stream<QuerySnapshot> read() {
  //   return this._animalProvider.read();
  // }
}