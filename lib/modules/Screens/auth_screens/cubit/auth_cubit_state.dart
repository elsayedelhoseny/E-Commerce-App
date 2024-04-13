abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {}

class FailedToRegisterState extends AuthStates {
  final String message;
  FailedToRegisterState({required this.message});
}

class ChangeValueSuccessState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {}

class FailedToLoginState extends AuthStates {
  final String message;
  FailedToLoginState({required this.message});
}

class LogoutSuccessState extends AuthStates {}

class FailedToLogoutState extends AuthStates {
  final String message;
  FailedToLogoutState({required this.message});
}
