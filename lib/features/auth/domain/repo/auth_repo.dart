import 'package:dartz/dartz.dart';
import 'package:egy_go/features/auth/data/model/models_request/login_request.dart';
import 'package:egy_go/features/auth/data/model/models_request/register_request.dart';
import 'package:egy_go/features/auth/data/model/models_request/reset_password_request.dart';
import 'package:egy_go/features/auth/data/model/models_request/verify_reset_code_request.dart';
import 'package:egy_go/features/auth/data/model/models_response/forget_password_model.dart';
import 'package:egy_go/features/auth/data/model/models_response/reset_password_model.dart';
import 'package:egy_go/features/auth/data/model/models_response/verify_reset_code_model.dart';
import '../../../../Core/error/failure.dart';
import '../../data/model/models_response/auth_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthModel>> userLogin(LoginRequest request);
  Future<Either<Failure, AuthModel>> userRegister(RegisterRequest request);
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword({
    required String email,
  });
  Future<Either<Failure, VerifyResetCodeModel>> verifyResetCode(
    VerifyResetCodeRequest request,
  );
  Future<Either<Failure, ResetPasswordModel>> resetPassword(
    ResetPasswordRequest request,
  );
}
