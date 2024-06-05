part of 'profile_cubit.dart';

class ProfileInitialState extends CoreState {}

class ProfileLoadingState extends CoreState {}

class ProfileSuccessState extends CoreState {
  ProfileSuccessState(this.user);

  final UserEntity user;

  @override
  List<Object?> get props => [user];
}

class ProfileFailureState extends CoreState {}