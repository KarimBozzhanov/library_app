import 'package:bloc/bloc.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/create_post/domain/use_case/add_post_use_case.dart';
import 'package:library_app/feature/home/domain/entity/post_entity.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<CoreState> {
  AddPostCubit()
      : _addPostUseCase = sl(),
        super(AddPostInitialState());

  final AddPostUseCase _addPostUseCase;


  Future<void> addPost(String title, String description, String tag) async {
    emit(AddPostLoadingState());

    try {
      final post = PostEntity(
        title: title,
        description: description,
        tag: tag,);
      await _addPostUseCase.execute(post);
      emit(AddPostSuccessState());
    } catch (e) {
      emit(AddPostFailureState());
      emit(AddPostInitialState());
    }
  }
}
