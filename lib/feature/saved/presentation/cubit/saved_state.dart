part of 'saved_cubit.dart';

class SavedInitialState extends CoreState {}

class SavedLoadingState extends CoreState {}

class SavedSuccessState extends CoreState {
  SavedSuccessState(this.savedBooks);

  final List<BookEntity> savedBooks;

  @override
  List<Object?> get props => [savedBooks];
}

class SavedFailureState extends CoreState {}