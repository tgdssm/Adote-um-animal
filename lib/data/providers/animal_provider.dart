import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as FirebaseStorage;
import 'package:pet_adoption_flutter_app/data/models/animal.dart';
import 'package:pet_adoption_flutter_app/utils/globals.dart';

class AnimalProvider {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('Animals');

  Future<void> create(Animal animal) async {
    await _collectionReference
        .doc(authProvider.email + ' ' + authProvider.displayName)
        .set({
      'userName': authProvider.displayName,
      'userEmail': authProvider.email,
    });
    await _collectionReference
        .doc(authProvider.email + ' ' + authProvider.displayName)
        .collection('Posts')
        .add(animal.toJson());
  }

  Future<void> update(Animal animal, String id) async {
    await _collectionReference
        .doc(authProvider.email + ' ' + authProvider.displayName)
        .collection('Posts')
        .doc(id)
        .update(animal.toJson());
  }

  Future<List<Animal>> read({String filter, String userId}) async {
    List<Animal> animals = [];
    QuerySnapshot snapshot;
    if (filter == null && userId == null) {
      snapshot = await _collectionReference.get();
      //TODO Future.forEach -> espera que cada futuro seja
      //TODO concluido antes de ir para o proximo;
      await Future.forEach(snapshot.docs,
          (QueryDocumentSnapshot element) async {
        await element.reference.collection('Posts').get().then((value) async {
          await Future.forEach(value.docs, (element2) {
            animals.add(Animal.fromJson(element2));
          });
        });
      });
    } else if (userId == null) {
      snapshot = await _collectionReference.get();
      await Future.forEach(snapshot.docs,
          (QueryDocumentSnapshot element) async {
        await element.reference
            .collection('Posts')
            .where('species', isEqualTo: filter)
            .get()
            .then((value) async {
          await Future.forEach(value.docs, (element2) {
            animals.add(Animal.fromJson(element2));
          });
        });
      });
    } else {
      snapshot = await _collectionReference.get();
      await Future.forEach(snapshot.docs,
          (QueryDocumentSnapshot element) async {
        await element.reference
            .collection('Posts')
            .where('uid', isEqualTo: userId)
            .get()
            .then((value) async {
          await Future.forEach(value.docs,
              (QueryDocumentSnapshot element2) async {
            animals.add(Animal.fromJson(element2));
          });
        });
      });
    }
    return animals;
  }

  Future<void> delete(String id) async {
    await _collectionReference.doc(id).delete();
  }

  Future<String> uploadImage(File image) async {
    final FirebaseStorage.Reference storage = FirebaseStorage
        .FirebaseStorage.instance
        .ref(authProvider.displayName +
            '/data/com.example.pet_adoption_flutter_app/file_picker/')
        .child(image.path.split('/').last);
    final uploadImage = await storage.putFile(image);
    return await uploadImage.ref.getDownloadURL();
  }

  Future<void> deleteImage(String photoName) async {
    final FirebaseStorage.Reference storage = FirebaseStorage
        .FirebaseStorage.instance
        .ref(authProvider.displayName +
            '/data/com.example.pet_adoption_flutter_app/file_picker/')
        .child(photoName);
    await storage.delete();
  }
}
