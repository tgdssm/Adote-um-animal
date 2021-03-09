import 'package:pet_adoption_flutter_app/data/models/animal.dart';
import 'package:pet_adoption_flutter_app/data/providers/animal_provider.dart';

class AnimalCharacteristicsController {
  final _animalProvider = AnimalProvider();

  Future<void> delete(Animal animal) async {
    await _animalProvider.deleteImage(animal.photo.substring(77, 80));
    await _animalProvider.delete(animal.idDoc);
  }
}