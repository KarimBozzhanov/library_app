import 'package:firebase_auth/firebase_auth.dart';
import 'package:library_app/common/data/network/cloud_firestore_api_service.dart';
import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/home/data/dto/post_dto.dart';
import 'package:library_app/feature/home/domain/entity/post_entity.dart';

class PostsRepository {
  PostsRepository() : _apiService = sl();

  final _auth = FirebaseAuth.instance;
  final CloudFirestoreApiService _apiService;

  Future<List<PostDto>> getPosts() async {
    final documents = await _apiService.getPosts();
    return documents.map((post) => PostDto.fromSnapshot(post)).toList();
  }

  Future<void> addPost(PostEntity post) async {
    final postEntity = post.copyWith(
      userName: _auth.currentUser?.email,
      userId: _auth.currentUser?.uid,
    );
    await _apiService.addPost(postEntity.toJson());
  }
}
