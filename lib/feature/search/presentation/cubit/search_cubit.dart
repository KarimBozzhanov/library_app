import 'package:bloc/bloc.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/home/domain/entity/book_entity.dart';
import 'package:library_app/feature/home/domain/use_case/get_books_use_case.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<CoreState> {
  SearchCubit() : _useCase = sl(), super(SearchInitialState());

  final GetBooksUseCase _useCase;

  List<BookEntity> _books = [];

  Future<void> initCubit() async {
    emit(SearchLoadingState());
    final books = await _useCase.execute();
    _books = books;
    emit(SearchEmptyState());
  }

  void search(String input) {
    if (input.isEmpty) {
      emit(SearchEmptyState());
      return;
    }
    emit(SearchLoadingState());
    final searchList = _books.where((book) => book.name.contains(input)).toList();
    if (searchList.isEmpty) {
      emit(SearchEmptyState());
      return;
    }
    emit(SearchSuccessState(searchList));
  }
}
