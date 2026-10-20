import 'package:egy_go/features/auth/data/model/models_response/verify_reset_code_model.dart';

abstract class VerifyResetCodeState {}

class VerifyResetCodeInitial extends VerifyResetCodeState {}

class VerifyResetCodeLoading extends VerifyResetCodeState {}

class VerifyResetCodeSuccess extends VerifyResetCodeState {
  final VerifyResetCodeModel verifyResetCodeModel;
  VerifyResetCodeSuccess({required this.verifyResetCodeModel});
}

class VerifyResetCodeFailure extends VerifyResetCodeState {
  final String errorMessage;
  VerifyResetCodeFailure({required this.errorMessage});
}
