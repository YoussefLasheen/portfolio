import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';


class Api {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String path;
  late CollectionReference ref;

  Api(this.path) {
    ref = _db.collection(path);
  }
  
  Future<DocumentSnapshot> getDocumentById(String? id) {
    return ref.doc(id).get();
  }

  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }

  Future<DocumentReference?> updateDocument(Map data, String id) {
    return ref.doc(id).set(data).then((value) => value as DocumentReference<Object>?);
  }
}
