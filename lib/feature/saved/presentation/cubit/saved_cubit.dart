import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/home/domain/entity/book_entity.dart';
import 'package:library_app/feature/home/domain/use_case/get_books_use_case.dart';

part 'saved_state.dart';

class SavedCubit extends Cubit<CoreState> {
  SavedCubit()
      : _useCase = sl(),
        super(SavedInitialState());

  final GetBooksUseCase _useCase;

  Future<void> initCubit() async {
    emit(SavedLoadingState());
    final books = await _useCase.execute();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final saved = books.where((book) => book.userId == user.uid).toList();
      emit(SavedSuccessState(saved));
    } else {
      emit(SavedFailureState());
    }
  }
}
