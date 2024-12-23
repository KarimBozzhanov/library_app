import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/post_details/data/repository/post_details_repository.dart';
import 'package:library_app/feature/post_details/domain/entity/comment_entity.dart';

class AddCommentUseCase {
  AddCommentUseCase() : _repository = sl();

  final PostDetailsRepository _repository;

  Future<void> addComment(CommentEntity comment) async {
    await _repository.addComment(comment);
  }
}
