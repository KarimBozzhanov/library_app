import 'package:bloc/bloc.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/auth/common/domain/entity/user_entity.dart';
import 'package:library_app/feature/profile/domain/use_case/profile_use_case.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<CoreState> {
  ProfileCubit()
      : _useCase = sl(),
        super(ProfileInitialState());

  final ProfileUseCase _useCase;

  Future<void> getCurrentUser() async {
    emit(ProfileLoadingState());
    try {
      final user = await _useCase.execute();
      emit(ProfileSuccessState(user));
    } catch (e) {
      emit(ProfileFailureState());
    }
  }
}
