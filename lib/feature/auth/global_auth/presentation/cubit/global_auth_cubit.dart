import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:library_app/common/constant/core_constant.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/auth/global_auth/domain/use_case/global_sign_in_use_case.dart';
import 'package:library_app/feature/auth/login/domain/use_case/login_use_case.dart';

part 'global_auth_state.dart';

class GlobalAuthCubit extends Cubit<CoreState> {
  GlobalAuthCubit()
      : _globalSignIn = sl(),
        _auth = sl(),
        super(GlobalAuthInitialState());

  final GlobalSignInUseCase _globalSignIn;
  final LoginUseCase _auth;

  Future<void> checkData() async {
    final user = await _globalSignIn.execute();
    if (user.userId?.isNotEmpty ?? false) {
      final email = user.email ?? CoreConstant.empty;
      final password = user.password ?? CoreConstant.empty;
      try {
        final request = await _auth.login(email, password);
        emit(
          GlobalAuthSuccessState(request),
        );
      } catch (e) {
        emit(
          GlobalLogOutState(),
        );
      }
    } else {
      emit(GlobalLogOutState());
    }
  }
}
