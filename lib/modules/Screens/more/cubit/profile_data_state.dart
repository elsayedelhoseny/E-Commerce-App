abstract class ProfileDataState {}

final class ProfileDataInitial extends ProfileDataState {}

final class GetUserDataLoadingState extends ProfileDataState {}

final class GetUserDataSuccessState extends ProfileDataState {}

class FailedToGetUserDataState extends ProfileDataState {
  String error;
  FailedToGetUserDataState({required this.error});
}

class ChangePasswordLoadingState extends ProfileDataState {}

class ChangePasswordSuccessState extends ProfileDataState {}

class ChangePasswordWithFailureState extends ProfileDataState {
  String error;

  ChangePasswordWithFailureState(this.error);
}
