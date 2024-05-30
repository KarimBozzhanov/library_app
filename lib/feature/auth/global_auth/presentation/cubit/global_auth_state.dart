part of 'global_auth_cubit.dart';

class GlobalAuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GlobalAuthInitial extends GlobalAuthState {}

class GlobalAuthSuccessState extends GlobalAuthState {
  GlobalAuthSuccessState(this.user);

  final User? user;

  @override
  List<Object?> get props => [user];
}

class GlobalLogOutState extends GlobalAuthState {}