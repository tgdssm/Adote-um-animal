import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as FirebaseStorage;
import 'package:pet_adoption_flutter_app/data/models/animal.dart';

class AnimalProvider {
  String _fileName = DateTime.now().microsecond.toString();
  final CollectionReference _collectionReference = FirebaseFirestore.instance
      .collection('Animals');


  Future<void> create(Animal animal) async {
    await _collectionReference.add(animal.toJson());
  }

  Future<String> uploadImage(File image) async{
    final FirebaseStorage.Reference storage = FirebaseStorage
        .FirebaseStorage.instance.ref().child(_fileName);
    final uploadImage = await storage.putFile(image);
    return await uploadImage.ref.getDownloadURL();
  }

   Future<List<Animal>> read() async{
    
  }
}
