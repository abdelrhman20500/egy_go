import 'package:egy_go/features/auth/data/model/models_response/auth_model.dart';

abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final AuthModel authModel;

  RegisterSuccess({required this.authModel});
}

final class RegisterFailure extends RegisterState {
  final String errMessage;
  RegisterFailure(this.errMessage);
}
