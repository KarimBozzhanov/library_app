import 'package:cloud_firestore/cloud_firestore.dart';

class PostDto {
  PostDto({
    this.id,
    this.title,
    this.description,
    this.tag,
    this.userId,
    this.userName,
  });

  factory PostDto.fromJson(Map<String, dynamic> json, String id) => PostDto(
    id: id,
    title: json['title'] as String?,
    description: json['description'] as String?,
    tag: json['tag'] as String?,
    userId: json['user_id'] as String?,
    userName: json['user_name'] as String?,
  );

  factory PostDto.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) => PostDto.fromJson(snapshot.data() ?? {}, snapshot.id);

  final String? id;
  final String? title;
  final String? description;
  final String? tag;
  final String? userId;
  final String? userName;
}
