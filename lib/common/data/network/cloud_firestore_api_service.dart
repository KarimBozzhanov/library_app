import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreApiService {

  final collection = FirebaseFirestore.instance.collection('books');

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getBooks() async {
    final documents = await collection.get();
    return documents.docs;
  }

  Future<void> book(String bookId) async {
    final getDocumentById = await collection.where("id", isEqualTo: bookId).get();
    final book = getDocumentById.docs.first.id;
    final document = await collection.doc(book).get();
  }
}
