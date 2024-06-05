import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:library_app/feature/auth/login/domain/use_case/login_use_case.dart';

class AuthApiService {
  final _auth = FirebaseAuth.instance;
  final collection = FirebaseFirestore.instance.collection('users');

  Future<UserCredential> login(GlobalAuthParam param) async {
    final credentials = await _auth.signInWithEmailAndPassword(email: param.email, password: param.password);
    return credentials;
  }

  Future<UserCredential> registration(GlobalAuthParam param) async {
    final credentials = await _auth.createUserWithEmailAndPassword(email: param.email, password: param.password);
    return credentials;
  }

  Future<void> addUser(Map<String, dynamic> data) async {
    await collection.add(data);
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getCurrentUser() async {
    final document = await collection.where('user_id', isEqualTo: _auth.currentUser?.uid).get();
    final user = document.docs.first;
    return user;
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }
}
