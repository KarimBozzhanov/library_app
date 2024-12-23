import 'package:bloc/bloc.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/post_details/domain/entity/comment_entity.dart';
import 'package:library_app/feature/post_details/domain/use_case/add_comment_use_case.dart';
import 'package:library_app/feature/post_details/domain/use_case/get_comments_use_case.dart';
import 'package:library_app/feature/home/domain/entity/post_entity.dart';

part 'post_details_state.dart';

class PostDetailsCubit extends Cubit<CoreState> {
  PostDetailsCubit()
      : _addCommentUseCase = sl(),
        _getCommentsUseCase = sl(),
        super(CommentsInitialState());

  final GetCommentsUseCase _getCommentsUseCase;
  final AddCommentUseCase _addCommentUseCase;

  Future<void> getComments(String postId) async {
    emit(CommentsLoadingState());
    try {
      final comments = await _getCommentsUseCase.getComments(postId);
      emit(CommentsSuccessState(comments));
    } catch (e) {
      emit(CommentsFailureState());
    }
  }

  Future<void> addComment(String comment, String postId) async {
    try {
      final commentEntity = CommentEntity(
        postId: postId,
        comment: comment,
      );
      await _addCommentUseCase.addComment(commentEntity);
      getComments(postId);
    } catch (e) {
      print('Can not add comment');
    }
  }
}
