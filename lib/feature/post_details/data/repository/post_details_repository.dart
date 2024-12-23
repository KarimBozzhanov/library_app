import 'package:firebase_auth/firebase_auth.dart';
import 'package:library_app/common/data/network/cloud_firestore_api_service.dart';
import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/home/data/dto/post_dto.dart';
import 'package:library_app/feature/post_details/data/dto/comment_dto.dart';
import 'package:library_app/feature/post_details/domain/entity/comment_entity.dart';

class PostDetailsRepository {
  PostDetailsRepository() : _apiService = sl();

  final CloudFirestoreApiService _apiService;
  final _auth = FirebaseAuth.instance;

  Future<PostDto> getPost(String postId) async {
    final post = await _apiService.getPost(postId);
    return PostDto.fromSnapshot(post);
  }

  Future<List<CommentDto>> getComments(String postId) async {
    final documents = await _apiService.getComments(postId);
    return documents.map((comment) => CommentDto.fromSnapshot(comment)).toList();
  }

  Future<void> addComment(CommentEntity comment) async {
    final commentEntity = comment.copyWith(
      userName: _auth.currentUser?.email,
    );
    await _apiService.addComment(commentEntity.toJson());
  }
}
