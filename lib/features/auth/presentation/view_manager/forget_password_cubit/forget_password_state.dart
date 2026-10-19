import '../../../data/model/models_response/forget_password_model.dart';

abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordFailure extends ForgetPasswordState {
  final String error;
  ForgetPasswordFailure({required this.error});
}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final ForgetPasswordModel forgetPasswordModel;
  ForgetPasswordSuccess({required this.forgetPasswordModel});
}
