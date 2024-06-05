import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/common/presentation/h_box.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/config/theme.dart';
import 'package:library_app/feature/home/presentation/ui/widgets/book_card.dart';
import 'package:library_app/feature/saved/presentation/cubit/saved_cubit.dart';
import 'package:library_app/generated/l10n.dart';

class SavedBuilder extends StatelessWidget {
  const SavedBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SavedCubit()..initCubit(),
      child: const SavedPage(),
    );
  }
}

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => context.read<SavedCubit>().initCubit(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                S.current.saved,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.rdBlack,
                ),
              ),
              const HBox(30),
              BlocBuilder<SavedCubit, CoreState>(
                builder: (context, state) {
                  if (state is SavedSuccessState) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.savedBooks.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 4,
                      ),
                      itemBuilder: (context, index) => BookCard(
                        state.savedBooks[index],
                      ),
                    );
                  } else if (state is SavedFailureState) {
                    return Center(
                      child: Text(
                        S.current.emptyList,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.rdBlack,
                        ),
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
