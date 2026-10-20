import 'package:dartz/dartz.dart';
import 'package:egy_go/Core/error/failure.dart';
import 'package:egy_go/features/auth/data/model/models_request/reset_password_request.dart';
import 'package:egy_go/features/auth/data/model/models_response/reset_password_model.dart';
import 'package:egy_go/features/auth/domain/repo/auth_repo.dart';

class ResetPasswordUseCase {
  final AuthRepo authRepo;

  ResetPasswordUseCase(this.authRepo);

  Future<Either<Failure, ResetPasswordModel>> call({
    required ResetPasswordRequest request,
  }) async {
    return await authRepo.resetPassword(request);
  }
}
