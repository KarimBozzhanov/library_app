import 'package:flutter/material.dart';
import 'package:library_app/config/theme.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
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
            child: Image.asset(
              AppImages.icDefaultAsset,
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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Classic',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.lightGrey,
                    fontWeight: FontWeight.w300,
                    fontSize: 11,
                  ),
                ),
                Text(
                  'The Picture of Dorian Gray',
                  maxLines: 2,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 17),
                  child: Text(
                    'Oscar Wilde',
                    maxLines: 1,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                ),
                Text(
                  '\$25.00',
                  maxLines: 1,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
