import 'package:firebase_auth/firebase_auth.dart';
import 'package:library_app/feature/auth/login/domain/use_case/login_use_case.dart';

class AuthApiService {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential> login(GlobalAuthParam param) async {
    final credentials = await _auth.signInWithEmailAndPassword(email: param.email, password: param.password);
    return credentials;
  }

  Future<UserCredential> registration(GlobalAuthParam param) async {
    final credentials = await _auth.createUserWithEmailAndPassword(email: param.email, password: param.password);
    return credentials;
  }


  Future<void> logOut() async {
    await _auth.signOut();
  }
}
