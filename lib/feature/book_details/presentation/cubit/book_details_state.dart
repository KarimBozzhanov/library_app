part of 'book_details_cubit.dart';

class BookDetailsInitialState extends CoreState {}

class BookDetailsLoadingState extends CoreState {}

class BookDetailsSuccessState extends CoreState {
  BookDetailsSuccessState(this.book);

  final BookEntity book;

  @override
  List<Object?> get props => [book];
}

class BookDetailsBookedState extends CoreState {}

class BookDetailsFailureState extends CoreState {}
