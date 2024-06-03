part of 'login_cubit.dart';

class LoginInitialState extends CoreState {}

class LoginLoadingState extends CoreState {}

class LoginSuccessState extends CoreState {
  LoginSuccessState(this.user);

  final User? user;

  @override
  List<Object?> get props => [user];
}

class LoginFailureState extends CoreState {}

