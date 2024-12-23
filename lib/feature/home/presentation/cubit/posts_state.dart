part of 'posts_cubit.dart';

class PostsInitialState extends CoreState {}

class PostsLoadingState extends CoreState {}

class PostsSuccessState extends CoreState {
  PostsSuccessState({
    this.posts = const [],
  });

  final List<PostEntity> posts;

  @override
  List<Object?> get props => [posts];
}

class PostsEmptyState extends CoreState {}

class PostsFailureState extends CoreState {}
