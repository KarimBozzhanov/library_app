part of 'registration_cubit.dart';

class RegistrationInitial extends CoreState {}

class RegistrationLoadingState extends CoreState {}

class RegistrationSuccessState extends CoreState {
  RegistrationSuccessState(this.user);

  final User? user;

  @override
  List<Object?> get props => [user];
}

class RegistrationFailureState extends CoreState {}
