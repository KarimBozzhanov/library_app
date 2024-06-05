import 'package:library_app/common/constant/core_constant.dart';
import 'package:library_app/feature/home/data/dto/book_dto.dart';
import 'package:library_app/generated/l10n.dart';

class BookEntity {
  BookEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.author,
    required this.category,
    required this.imageUrl,
    required this.type,
    required this.userId,
    required this.canAdd,
    required this.downloadUrl,
  });

  factory BookEntity.fromDto(BookDto dto) => BookEntity(
        id: dto.id ?? CoreConstant.empty,
        name: dto.name ?? CoreConstant.empty,
        description: dto.description ?? CoreConstant.empty,
        author: dto.author ?? CoreConstant.empty,
        category: dto.category ?? CoreConstant.empty,
        imageUrl: dto.imageUrl ?? CoreConstant.empty,
        type: dto.type ?? CoreConstant.zeroInt,
        userId: dto.userId ?? CoreConstant.empty,
        canAdd: dto.canAdd ?? true,
        downloadUrl: dto.downloadUrl ?? CoreConstant.empty,
      );

  static List<BookEntity> fromDtoList(List<BookDto> dtoList) {
    final booksList = <BookEntity>[];
    for (var book in dtoList) {
      booksList.add(BookEntity.fromDto(book));
    }
    return booksList;
  }

  BookEntity copyWith({
    String? id,
    String? name,
    String? description,
    String? author,
    String? category,
    String? imageUrl,
    int? type,
    String? userId,
    bool? canAdd,
    String? downloadUrl,
  }) =>
      BookEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        author: author ?? this.author,
        category: category ?? this.category,
        imageUrl: imageUrl ?? this.imageUrl,
        type: type ?? this.type,
        userId: userId ?? this.userId,
        canAdd: canAdd ?? this.canAdd,
        downloadUrl: downloadUrl ?? this.downloadUrl,
      );

  final String id;
  final String name;
  final String description;
  final String author;
  final String category;
  final String imageUrl;
  final int type;
  final String userId;
  final bool canAdd;
  final String downloadUrl;

  String get typeStr => type.toString();

  String get status {
    if (canAdd) {
      return S.current.inLibrary;
    }
    return S.current.booked;
  }
}
