import '../../../data/model/models_response/auth_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String error;
  LoginFailure({required this.error});
}

class LoginSuccess extends LoginState {
  final AuthModel authModel;
  LoginSuccess({required this.authModel});
}
