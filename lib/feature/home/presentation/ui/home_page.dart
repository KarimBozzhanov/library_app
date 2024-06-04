import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/config/theme.dart';
import 'package:library_app/feature/home/presentation/cubit/books_cubit.dart';
import 'package:library_app/feature/home/presentation/ui/widgets/book_card.dart';
import 'package:library_app/generated/l10n.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class HomeBuilder extends StatelessWidget {
  const HomeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BooksCubit()..getBooks(),
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
      body: BlocConsumer<BooksCubit, CoreState>(
        listener: (context, state) {
          if (state is BooksFailureState) {
            showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(
                  message: S.current.failedToRetrieveData,
                ));
          }
        },
        builder: (context, state) {
          if (state is BooksSuccessState) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.current.happyReading,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.rdBlack,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            size: 32,
                            color: AppColors.rdBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.current.topBooks,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: AppColors.rdBlack,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            S.current.seeMore,
                            style: const TextStyle(color: AppColors.rdBlack, fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    height: 320,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.topBooks.length,
                      itemBuilder: (context, index) => BookCard(state.topBooks[index]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.current.latestBooks,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: AppColors.rdBlack,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            S.current.seeMore,
                            style: const TextStyle(color: AppColors.rdBlack, fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    height: 320,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.latestBooks.length,
                      itemBuilder: (context, index) => BookCard(state.latestBooks[index]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.current.upcomingBooks,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: AppColors.rdBlack,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            S.current.seeMore,
                            style: const TextStyle(color: AppColors.rdBlack, fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    height: 320,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.upcomingBooks.length,
                      itemBuilder: (context, index) => BookCard(state.upcomingBooks[index]),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is BooksEmptyState || state is BooksFailureState) {
            return Center(
              child: Text(
                S.current.emptyList,
                style: const TextStyle(
                  color: AppColors.rdBlack,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
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
}
