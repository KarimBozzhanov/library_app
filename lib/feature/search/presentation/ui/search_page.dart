import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/common/constant/core_constant.dart';
import 'package:library_app/common/presentation/app_common_text_field.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/config/theme.dart';
import 'package:library_app/feature/home/presentation/ui/widgets/post_card.dart';
import 'package:library_app/feature/search/presentation/cubit/search_cubit.dart';
import 'package:library_app/generated/l10n.dart';

class SearchBuilder extends StatelessWidget {
  const SearchBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit()..initCubit(),
      child: const SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          searchController.text = CoreConstant.empty;
          context.read<SearchCubit>().initCubit();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              AppCommonTextField(
                textEditingController: searchController,
                label: S.of(context).search,
                margin: const EdgeInsets.only(bottom: 24, top: 30),
                onChanged: (input) => context.read<SearchCubit>().search(input),
              ),
              BlocBuilder<SearchCubit, CoreState>(
                builder: (context, state) {
                  if (state is SearchSuccessState) {
                    return ListView.builder(
                      padding: const EdgeInsets.only(left: 16, top: 20),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) =>
                          PostCard(state.posts[index]),
                    );
                  } else if (state is SearchEmptyState) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text(
                        S.of(context).emptyList,
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
