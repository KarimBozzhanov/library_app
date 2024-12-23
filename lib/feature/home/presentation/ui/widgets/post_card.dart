import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:library_app/config/theme.dart';
import 'package:library_app/feature/post_details/presentation/ui/post_details_screen.dart';
import 'package:library_app/feature/home/domain/entity/post_entity.dart';

class PostCard extends StatelessWidget {
  const PostCard(this.post, {super.key});

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostDetailsBuilder(post),
            ),
          );
        },
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 11, 20, 11),
              decoration: BoxDecoration(
                color: AppColors.brightGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(
                AppImages.icAvatar,
                width: 70,
                height: 70,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
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
                      post.title,
                      maxLines: 2,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      post.description,
                      maxLines: 3,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
