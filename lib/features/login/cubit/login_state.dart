abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoadingLoginState extends LoginState {}

class ErrorLoginState extends LoginState {
  final String message;
  ErrorLoginState(this.message);
}

class SuccessLoginState extends LoginState {
  final String message;
  SuccessLoginState(this.message);
}
