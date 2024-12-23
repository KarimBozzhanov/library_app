import 'package:bloc/bloc.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/home/domain/entity/post_entity.dart';
import 'package:library_app/feature/home/domain/use_case/get_posts_use_case.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<CoreState> {
  SearchCubit() : _useCase = sl(), super(SearchInitialState());

  final GetPostsUseCase _useCase;

  List<PostEntity> _posts = [];

  Future<void> initCubit() async {
    emit(SearchLoadingState());
    final posts = await _useCase.execute();
    _posts = posts;
    emit(SearchEmptyState());
  }

  void search(String input) {
    if (input.isEmpty) {
      emit(SearchEmptyState());
      return;
    }
    emit(SearchLoadingState());
    final searchList = _posts.where((book) => book.title.contains(input)).toList();
    if (searchList.isEmpty) {
      emit(SearchEmptyState());
      return;
    }
    emit(SearchSuccessState(searchList));
  }
}
