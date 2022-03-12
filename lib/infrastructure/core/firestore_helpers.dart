import 'package:cloud_firestore/cloud_firestore.dart';

extension FirestoreX on FirebaseFirestore {
  CollectionReference get rotuineCollection => collection('routines');
  CollectionReference get smartItemCollection => collection('smart_items');
}
