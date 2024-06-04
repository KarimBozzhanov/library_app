import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreApiService {

  final collection = FirebaseFirestore.instance.collection('books');

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getBooks() async {
    final documents = await collection.get();
    return documents.docs;
  }
}
