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

  Future<void> update(Animal animal, String id) async{
    await _collectionReference.doc(id).update(animal.toJson());
  }

  Future<String> uploadImage(File image) async{
    final FirebaseStorage.Reference storage = FirebaseStorage
        .FirebaseStorage.instance.ref().child(_fileName);
    final uploadImage = await storage.putFile(image);
    return await uploadImage.ref.getDownloadURL();
  }

  Future<void> deleteImage(String photoName) async{
    final FirebaseStorage.Reference storage = FirebaseStorage
        .FirebaseStorage.instance.ref().child(photoName);
    await storage.delete();
  }

   Future<List<Animal>> read({String filter, String userId}) async{
    List<Animal> animals = [];
    QuerySnapshot snapshot;
    if(filter == null && userId == null)
      snapshot = await _collectionReference.get();
    else if(userId == null)
      snapshot = await _collectionReference.where('species', isEqualTo: filter).get();
    else
      snapshot = await _collectionReference.where('uid', isEqualTo: userId).get();
    snapshot.docs.forEach((element  ) {
      animals.add(Animal.fromJson(element));
    });
    return animals;
  }

  Future<void> delete(String id) async {
   await _collectionReference.doc(id).delete();
  }
}
