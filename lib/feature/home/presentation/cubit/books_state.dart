part of 'books_cubit.dart';

class BooksInitialState extends CoreState {}

class BooksLoadingState extends CoreState {}

class BooksSuccessState extends CoreState {
  BooksSuccessState({
    this.topBooks = const [],
    this.latestBooks = const [],
    this.upcomingBooks = const [],
  });

  final List<BookEntity> topBooks;
  final List<BookEntity> latestBooks;
  final List<BookEntity> upcomingBooks;

  @override
  List<Object?> get props => [topBooks, latestBooks, upcomingBooks];
}

class BooksEmptyState extends CoreState {}

class BooksFailureState extends CoreState {}
