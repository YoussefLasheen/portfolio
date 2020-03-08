import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';


class Api {
  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference ref;

  Api(this.path) {
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.getDocuments() ;
  }
  
  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.document(id).get();
  }

  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }
}
