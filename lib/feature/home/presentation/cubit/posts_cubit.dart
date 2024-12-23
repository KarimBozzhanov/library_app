import 'package:bloc/bloc.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/home/domain/entity/post_entity.dart';
import 'package:library_app/feature/home/domain/use_case/get_posts_use_case.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<CoreState> {
  PostsCubit()
      : _postsUseCase = sl(),
        super(PostsInitialState());

  final GetPostsUseCase _postsUseCase;
  List<PostEntity> posts = [];

  Future<void> getBooks() async {
    emit(PostsLoadingState());
    try {
      posts = await _postsUseCase.execute();
      if (posts.isEmpty) {
        emit(PostsEmptyState());
        return;
      }
      emit(
        PostsSuccessState(
          posts: posts,
        ),
      );
    } catch (e) {
      emit(PostsFailureState());
    }
  }
}
