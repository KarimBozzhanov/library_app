part of 'post_details_cubit.dart';

class CommentsInitialState extends CoreState {}

class CommentsLoadingState extends CoreState {}

class CommentsSuccessState extends CoreState {
  CommentsSuccessState(this.comments);

  final List<CommentEntity> comments;

  @override
  List<Object?> get props => [comments];
}

class CommentsFailureState extends CoreState {}

class AddCommentsSuccessState extends CoreState {}