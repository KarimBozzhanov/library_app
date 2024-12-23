import 'package:library_app/common/constant/core_constant.dart';
import 'package:library_app/feature/post_details/data/dto/comment_dto.dart';

class CommentEntity {
  CommentEntity({
    this.id = CoreConstant.empty,
    this.postId = CoreConstant.empty,
    this.comment = CoreConstant.empty,
    this.userName = CoreConstant.empty,
  });

  factory CommentEntity.fromDto(CommentDto dto) => CommentEntity(
    id: dto.id ?? CoreConstant.empty,
    postId: dto.postId ?? CoreConstant.empty,
    comment: dto.comment ?? CoreConstant.empty,
    userName: dto.userName ?? CoreConstant.empty,
  );

  static List<CommentEntity> fromDtoList(List<CommentDto> dtoList) {
    final commentsList = <CommentEntity>[];
    for (var comment in dtoList) {
      commentsList.add(CommentEntity.fromDto(comment));
    }
    return commentsList;
  }


  CommentEntity copyWith({String? postId, String? comment, String? userName,}) => CommentEntity(
    postId: postId ?? this.postId,
    comment: comment ?? this.comment,
    userName: userName ?? this.userName,
  );

  final String id;
  final String postId;
  final String comment;
  final String userName;

  Map<String, dynamic> toJson() => {
    'post_id': postId,
    'comment': comment,
    'user_name': userName,
  };
}
