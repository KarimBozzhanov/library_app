import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/common/presentation/app_rounded_container.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/feature/create_post/presentation/cubit/add_post_cubit.dart';
import 'package:library_app/generated/l10n.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../config/theme.dart';

class CreatePostBuilder extends StatelessWidget {
  const CreatePostBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostCubit(),
      child: const CreatePostScreen(),
    );
  }
}

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  late TextEditingController _title;
  late TextEditingController _description;
  late TextEditingController _tag;

  @override
  void initState() {
    _title = TextEditingController();
    _description = TextEditingController();
    _tag = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPostCubit, CoreState>(
      listener: (context, state) {
        if (state is AddPostSuccessState) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(message: S.of(context).postAdded),
          );
          Navigator.pop(context);
        } else if (state is AddPostFailureState) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(message: S.of(context).failedToAddPost),
          );
        }
      },
      buildWhen: (context, state) => state is AddPostInitialState || state is AddPostLoadingState,
      builder: (context, state) {
        if (state is AddPostLoadingState) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                S.of(context).addPost,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.rdBlack,
                ),
              ),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              S.of(context).addPost,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.rdBlack,
              ),
            ),
          ),
          bottomSheet: AppRoundedContainer(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            onTap: () => context.read<AddPostCubit>().addPost(
                  _title.text,
                  _description.text,
                  _tag.text,
                ),
            child: Text(
              S.of(context).addPost,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
            child: Column(
              children: [
                TextField(
                  controller: _title,
                  decoration: InputDecoration(
                    hintText: S.of(context).postTitle,
                  ),
                ),
                TextField(
                  controller: _description,
                  decoration: InputDecoration(
                    hintText: S.of(context).postDescription,
                  ),
                ),
                TextField(
                  controller: _tag,
                  decoration: InputDecoration(
                    hintText: S.of(context).postTag,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    _tag.dispose();
    super.dispose();
  }
}
