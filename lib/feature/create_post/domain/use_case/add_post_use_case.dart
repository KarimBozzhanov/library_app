import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/home/data/repository/posts_repository.dart';
import 'package:library_app/feature/home/domain/entity/post_entity.dart';

class AddPostUseCase {

  AddPostUseCase() : _repository = sl();

  final PostsRepository _repository;

  Future<void> execute(PostEntity post) async {
    await _repository.addPost(post);
  }
}
