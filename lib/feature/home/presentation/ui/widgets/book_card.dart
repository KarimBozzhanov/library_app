import 'package:flutter/material.dart';
import 'package:library_app/config/theme.dart';
import 'package:library_app/feature/book_details/presentation/ui/book_details_screen.dart';
import 'package:library_app/feature/home/domain/entity/book_entity.dart';

class BookCard extends StatelessWidget {
  const BookCard(this.book, {super.key});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailsScreen(book),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 180,
              padding: const EdgeInsets.fromLTRB(45, 11, 45, 0),
              decoration: const BoxDecoration(
                color: AppColors.brightGrey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  topLeft: Radius.circular(8),
                ),
              ),
              child: Image.network(
                book.imageUrl,
                width: 91,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 180,
              decoration: const BoxDecoration(
                color: AppColors.rdBlack,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(10, 12, 10, 19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.category,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.lightGrey,
                      fontWeight: FontWeight.w300,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    book.name,
                    maxLines: 2,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 17),
                    child: Text(
                      book.author,
                      maxLines: 1,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
