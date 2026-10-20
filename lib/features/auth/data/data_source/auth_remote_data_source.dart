import 'package:egy_go/Core/Api/api_consumer.dart';
import 'package:egy_go/Core/Api/end_point.dart';
import 'package:egy_go/features/auth/data/model/models_request/login_request.dart';
import 'package:egy_go/features/auth/data/model/models_request/register_request.dart';
import 'package:egy_go/features/auth/data/model/models_request/reset_password_request.dart';
import 'package:egy_go/features/auth/data/model/models_response/auth_model.dart';
import 'package:egy_go/features/auth/data/model/models_response/forget_password_model.dart';
import 'package:egy_go/features/auth/data/model/models_response/reset_password_model.dart';
import 'package:egy_go/features/auth/data/model/models_response/verify_reset_code_model.dart';
import 'package:egy_go/features/auth/data/model/models_request/verify_reset_code_request.dart';

abstract class AuthBaseRemoteDataSource {
  Future<AuthModel> userLogin(LoginRequest request);
  Future<AuthModel> userRegister(RegisterRequest request);
  Future<ForgetPasswordModel> forgetPassword({required String email});
  Future<VerifyResetCodeModel> verifyResetCode(VerifyResetCodeRequest request);
  Future<ResetPasswordModel> resetPassword(ResetPasswordRequest request);
}

class AuthRemoteDataSource extends AuthBaseRemoteDataSource {
  final ApiConsumer apiConsumer;
  AuthRemoteDataSource(this.apiConsumer);

  @override
  Future<AuthModel> userLogin(LoginRequest request) async {
    final response = await apiConsumer.post(
      EndPoint.login,
      data: request.toJson(),
    );
    print("Login Success ✅");
    return AuthModel.fromJson(response);
  }

  @override
  Future<AuthModel> userRegister(RegisterRequest request) async {
    final response = await apiConsumer.post(
      EndPoint.register,
      data: request.toJson(),
    );
    print("Register Success ✅");
    return AuthModel.fromJson(response);
  }

  @override
  Future<ForgetPasswordModel> forgetPassword({required String email}) async {
    final response = await apiConsumer.post(
      EndPoint.forgetPassword,
      data: {"email": email},
    );

    print("Forget Password Success ✅");
    print(response);

    return ForgetPasswordModel.fromJson(response);
  }

  @override
  Future<VerifyResetCodeModel> verifyResetCode(
    VerifyResetCodeRequest request,
  ) async {
    final response = await apiConsumer.post(
      EndPoint.verifyResetCode,
      data: request.toJson(),
    );
    print("Verify Reset Code Success ✅");
    return VerifyResetCodeModel.fromJson(response);
  }

  @override
  Future<ResetPasswordModel> resetPassword(ResetPasswordRequest request) async {
    final response = await apiConsumer.post(
      EndPoint.resetPassword,
      data: request.toJson(),
    );
    print("Reset Password Success ✅");
    return ResetPasswordModel.fromJson(response);
  }
}
