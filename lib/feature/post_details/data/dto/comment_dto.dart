import 'package:cloud_firestore/cloud_firestore.dart';

class CommentDto {
  CommentDto({
    this.id,
    this.postId,
    this.comment,
    this.userName,
  });

  factory CommentDto.fromJson(Map<String, dynamic> json, String id) => CommentDto(
        id: id,
        postId: json['post_id'] as String?,
        comment: json['comment'] as String?,
        userName: json['user_name'] as String?,
      );

  factory CommentDto.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) => CommentDto.fromJson(snapshot.data() ?? {}, snapshot.id);

  final String? id;
  final String? postId;
  final String? comment;
  final String? userName;
}
