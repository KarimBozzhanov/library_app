import 'package:cloud_firestore/cloud_firestore.dart';

class BookDto {
  BookDto({
    this.id,
    this.name,
    this.description,
    this.author,
    this.category,
    this.imageUrl,
    this.type,
    this.userId,
    this.canAdd,
    this.downloadUrl,
  });

  factory BookDto.fromJson(Map<String, dynamic> json, String id) => BookDto(
    id: id,
    name: json['name'] as String?,
    description: json['description'] as String?,
    author: json['author'] as String?,
    category: json['category'] as String?,
    imageUrl: json['image_url'] as String?,
    type: json['type'] as int?,
    userId: json['user_id'] as String?,
    canAdd: json['can_add'] as bool?,
    downloadUrl: json['download_url'] as String?,
  );

  factory BookDto.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) => BookDto.fromJson(snapshot.data() ?? {}, snapshot.id);

  final String? id;
  final String? name;
  final String? description;
  final String? author;
  final String? category;
  final String? imageUrl;
  final int? type;
  final String? userId;
  final bool? canAdd;
  final String? downloadUrl;
}
