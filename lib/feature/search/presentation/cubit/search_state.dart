part of 'search_cubit.dart';

class SearchInitialState extends CoreState {}

class SearchLoadingState extends CoreState {}

class SearchSuccessState extends CoreState {
  SearchSuccessState(this.posts);

  final List<PostEntity> posts;

  @override
  List<Object?> get props => [posts];
}

class SearchEmptyState extends CoreState {}

class SearchFailureState extends CoreState {}
