import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/config/theme.dart';
import 'package:library_app/feature/home/domain/entity/post_entity.dart';
import 'package:library_app/feature/post_details/presentation/cubit/post_details_cubit.dart';
import 'package:library_app/feature/post_details/presentation/ui/widgets/comment_card.dart';
import 'package:library_app/generated/l10n.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class PostDetailsBuilder extends StatelessWidget {
  const PostDetailsBuilder(this.post, {super.key});

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostDetailsCubit()..getComments(post.id),
      child: PostDetailsScreen(post),
    );
  }
}

class PostDetailsScreen extends StatefulWidget {
  const PostDetailsScreen(this.post, {super.key});

  final PostEntity post;

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  late TextEditingController _comment;

  @override
  void initState() {
    _comment = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.post.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.rdBlack,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: S.of(context).author,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: widget.post.userName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "${S.of(context).postTag}: ",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: widget.post.tag,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Text(
              S.of(context).description,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.rdBlack,
              ),
            ),
            Text(
              widget.post.description,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.rdBlack,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: TextField(
                controller: _comment,
                decoration: InputDecoration(
                  hintText: S.of(context).addComment,
                ),
                onSubmitted: (value) {
                  context.read<PostDetailsCubit>().addComment(
                      value,
                      widget.post.id,
                    );
                  _comment.clear();
                },
              ),
            ),
            BlocConsumer<PostDetailsCubit, CoreState>(
              listener: (context, state) {
                if (state is CommentsFailureState) {
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.error(message: S.of(context).failedToRetrieveData),
                  );
                } else if (state is AddCommentsSuccessState) {
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.success(
                      message: S.of(context).bookAddedToFavorites,
                    ),
                  );
                }
              },
              buildWhen: (context, state) => state is CommentsSuccessState || state is CommentsLoadingState,
              builder: (context, state) {
                if (state is CommentsSuccessState) {
                  return ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 16, bottom: 20),
                    itemCount: state.comments.length,
                    itemBuilder: (context, index) => CommentCard(
                      state.comments[index],
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
