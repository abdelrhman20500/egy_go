import 'package:dartz/dartz.dart';
import 'package:egy_go/Core/error/failure.dart';
import 'package:egy_go/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:egy_go/features/auth/data/model/models_request/login_request.dart';
import 'package:egy_go/features/auth/data/model/models_request/register_request.dart';
import 'package:egy_go/features/auth/data/model/models_request/reset_password_request.dart';
import 'package:egy_go/features/auth/data/model/models_response/auth_model.dart';
import 'package:egy_go/features/auth/data/model/models_response/forget_password_model.dart';
import 'package:egy_go/features/auth/data/model/models_response/reset_password_model.dart';
import 'package:egy_go/features/auth/data/model/models_response/verify_reset_code_model.dart';
import 'package:egy_go/features/auth/data/model/models_request/verify_reset_code_request.dart';
import '../../../../Core/error/exceptions.dart';
import '../../domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthBaseRemoteDataSource authBaseRemoteDataSource;
  AuthRepoImpl({required this.authBaseRemoteDataSource});

  @override
  Future<Either<Failure, AuthModel>> userLogin(LoginRequest request) async {
    try {
      final result = await authBaseRemoteDataSource.userLogin(request);
      return right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> userRegister(
    RegisterRequest request,
  ) async {
    try {
      final result = await authBaseRemoteDataSource.userRegister(request);
      return right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message.toString()));
    }
  }

  @override
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword({
    required String email,
  }) async {
    try {
      final result = await authBaseRemoteDataSource.forgetPassword(
        email: email,
      );
      return right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message.toString()));
    }
  }

  @override
  Future<Either<Failure, VerifyResetCodeModel>> verifyResetCode(
    VerifyResetCodeRequest request,
  ) async {
    try {
      final result = await authBaseRemoteDataSource.verifyResetCode(request);
      return right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message.toString()));
    }
  }

  @override
  Future<Either<Failure, ResetPasswordModel>> resetPassword(
    ResetPasswordRequest request,
  ) async {
    try {
      final result = await authBaseRemoteDataSource.resetPassword(request);
      return right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message.toString()));
    }
  }
}
