import 'package:bloc/bloc.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/book_details/domain/use_case/book_details_use_case.dart';
import 'package:library_app/feature/book_details/domain/use_case/get_book_details_use_case.dart';
import 'package:library_app/feature/home/domain/entity/book_entity.dart';

part 'book_details_state.dart';

class BookDetailsCubit extends Cubit<CoreState> {
  BookDetailsCubit()
      : _useCase = sl(),
        _getBookDetailsUseCase = sl(),
        super(BookDetailsInitialState());

  final BookDetailsUseCase _useCase;
  final GetBookDetailsUseCase _getBookDetailsUseCase;

  late BookEntity _book;

  Future<void> getBook(String bookId) async {
    emit(BookDetailsLoadingState());
    try {
      _book = await _getBookDetailsUseCase.getBook(bookId);
      emit(
        BookDetailsSuccessState(_book),
      );
    } catch (e) {
      emit(BookDetailsFailureState());
    }
  }

  Future<void> book(String bookId) async {
    emit(BookDetailsLoadingState());
    try {
      await _useCase.book(bookId);
      final updatedBook = _book.copyWith(canAdd: false);
      emit(BookDetailsSuccessState(updatedBook));
      emit(BookDetailsBookedState());
    } catch (e) {
      emit(BookDetailsFailureState());
    }
  }
}
