import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/config/theme.dart';
import 'package:library_app/feature/home/presentation/cubit/posts_cubit.dart';
import 'package:library_app/feature/home/presentation/ui/widgets/post_card.dart';
import 'package:library_app/generated/l10n.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class HomeBuilder extends StatelessWidget {
  const HomeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit()..getBooks(),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: BlocConsumer<PostsCubit, CoreState>(
        listener: (context, state) {
          if (state is PostsFailureState) {
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(
                message: S.of(context).failedToRetrieveData,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is PostsSuccessState) {
            return RefreshIndicator(
              onRefresh: () => onRefresh(context),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              S.of(context).happyReading,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.rdBlack,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: state.posts.isNotEmpty,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(left: 16, top: 20),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.posts.length,
                        itemBuilder: (context, index) =>
                            PostCard(state.posts[index]),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is PostsEmptyState || state is PostsFailureState) {
            return RefreshIndicator(
              onRefresh: () => onRefresh(context),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Center(
                  child: Text(
                    S.of(context).emptyList,
                    style: const TextStyle(
                      color: AppColors.rdBlack,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future<void> onRefresh(BuildContext context) async {
    context.read<PostsCubit>().getBooks();
  }
}
