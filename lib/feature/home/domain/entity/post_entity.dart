import 'package:library_app/common/constant/core_constant.dart';
import 'package:library_app/feature/home/data/dto/post_dto.dart';
import 'package:library_app/generated/l10n.dart';

class PostEntity {
  PostEntity({
    this.id = CoreConstant.empty,
    this.title = CoreConstant.empty,
    this.description = CoreConstant.empty,
    this.tag = CoreConstant.empty,
    this.userId = CoreConstant.empty,
    this.userName = CoreConstant.empty,
  });

  factory PostEntity.fromDto(PostDto dto) => PostEntity(
        id: dto.id ?? CoreConstant.empty,
        title: dto.title ?? CoreConstant.empty,
        description: dto.description ?? CoreConstant.empty,
        tag: dto.tag ?? CoreConstant.empty,
        userId: dto.userId ?? CoreConstant.empty,
        userName: dto.userName ?? CoreConstant.empty,
      );

  static List<PostEntity> fromDtoList(List<PostDto> dtoList) {
    final booksList = <PostEntity>[];
    for (var book in dtoList) {
      booksList.add(PostEntity.fromDto(book));
    }
    return booksList;
  }

  PostEntity copyWith({
    String? id,
    String? title,
    String? description,
    String? tag,
    String? userId,
    String? userName,
  }) =>
      PostEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        tag: tag ?? this.tag,
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
      );

  final String id;
  final String title;
  final String description;
  final String tag;
  final String userId;
  final String userName;


  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'tag': tag,
    'user_id': userId,
    'user_name': userName,
  };
}
