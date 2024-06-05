import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFirestoreApiService {
  final collection = FirebaseFirestore.instance.collection('books');

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getBooks() async {
    final documents = await collection.get();
    return documents.docs;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getBook(String bookId) async {
    final document = await collection.doc(bookId).get();
    return document;
  }

  Future<void> book(String bookId, Map<String, dynamic> data) async {
    final document = collection.doc(bookId);
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      document.update(data);
    }
  }
}
