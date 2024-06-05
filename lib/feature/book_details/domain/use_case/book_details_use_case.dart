import 'package:firebase_auth/firebase_auth.dart';
import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/book_details/data/repository/book_details_repository.dart';

class BookDetailsUseCase {
  BookDetailsUseCase() : _repository = sl();

  final BookDetailsRepository _repository;

  Future<void> book(String bookId) async {
    final user = FirebaseAuth.instance.currentUser;
    Map<String, dynamic> data = {};
    if (user != null) {
      data = {
        'can_add': false,
        'user_id': user.uid,
      };
      await _repository.book(bookId, data);
    }
  }
}