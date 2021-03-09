import 'package:pet_adoption_flutter_app/data/models/animal.dart';
import 'package:pet_adoption_flutter_app/data/providers/animal_provider.dart';
import 'package:pet_adoption_flutter_app/utils/globals.dart';

class UserAdvertisementController {
  final _animalProvider = AnimalProvider();

  Future<List<Animal>> readByUserId() async {
    return await _animalProvider.read(userId: authProvider.uid);
  }

  Future<void> delete(String id) async {
    await _animalProvider.delete(id);
  }
}