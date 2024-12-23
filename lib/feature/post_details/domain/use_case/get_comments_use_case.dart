import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/post_details/data/repository/post_details_repository.dart';
import 'package:library_app/feature/home/domain/entity/post_entity.dart';
import 'package:library_app/feature/post_details/domain/entity/comment_entity.dart';

class GetCommentsUseCase {
  GetCommentsUseCase() : _repository = sl();

  final PostDetailsRepository _repository;

  Future<List<CommentEntity>> getComments(String postId) async {
    final dtoList = await _repository.getComments(postId);
    return CommentEntity.fromDtoList(dtoList);
  }
}