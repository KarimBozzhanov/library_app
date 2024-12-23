import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreApiService {
  final collection = FirebaseFirestore.instance.collection('posts');
  final commentsCollection = FirebaseFirestore.instance.collection('comments');

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getPosts() async {
    final documents = await collection.get();
    return documents.docs;
  }

  Future<void> addPost(Map<String, dynamic> post) async {
    await collection.add(post);
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getPost(String postId) async {
    final document = await collection.doc(postId).get();
    return document;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getComments(String postId) async {
    final documents = await commentsCollection.where('post_id', isEqualTo: postId).get();
    return documents.docs;
  }

  Future<void> addComment(Map<String, dynamic> comment) async {
    await commentsCollection.add(comment);
  }
}
