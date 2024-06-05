part of 'search_cubit.dart';

class SearchInitialState extends CoreState {}

class SearchLoadingState extends CoreState {}

class SearchSuccessState extends CoreState {
  SearchSuccessState(this.books);

  final List<BookEntity> books;

  @override
  List<Object?> get props => [books];
}

class SearchEmptyState extends CoreState {}

class SearchFailureState extends CoreState {}
