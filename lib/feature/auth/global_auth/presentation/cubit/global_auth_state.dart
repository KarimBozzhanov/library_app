part of 'global_auth_cubit.dart';

class GlobalAuthInitialState extends CoreState {}

class GlobalAuthSuccessState extends CoreState {
  GlobalAuthSuccessState(this.user);

  final User? user;

  @override
  List<Object?> get props => [user];
}

class GlobalLogOutState extends CoreState {}