import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:library_app/feature/post_details/domain/entity/comment_entity.dart';

import '../../../../../config/theme.dart';

class CommentCard extends StatelessWidget {
  const CommentCard(this.comment, {super.key});

  final CommentEntity comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: AppColors.brightGrey,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            AppImages.icAvatar,
            width: 30,
            height: 30,
          ),
        ),
        Column(
          children: [
            Container(
              width: 180,
              decoration: const BoxDecoration(
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
                    comment.userName,
                    maxLines: 2,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    comment.comment,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

