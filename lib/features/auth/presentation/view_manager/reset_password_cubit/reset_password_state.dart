import 'package:egy_go/features/auth/data/model/models_response/reset_password_model.dart';

abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {
  final ResetPasswordModel resetPasswordModel;
  ResetPasswordSuccess({required this.resetPasswordModel});
}

class ResetPasswordFailure extends ResetPasswordState {
  final String errorMessage;
  ResetPasswordFailure({required this.errorMessage});
}
