import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/home/data/repository/posts_repository.dart';
import 'package:library_app/feature/home/domain/entity/post_entity.dart';

class GetPostsUseCase {
  GetPostsUseCase() :_repository = sl();

  final PostsRepository _repository;

  Future<List<PostEntity>> execute() async {
    final postList = await _repository.getPosts();
    return PostEntity.fromDtoList(postList);
  }
}
