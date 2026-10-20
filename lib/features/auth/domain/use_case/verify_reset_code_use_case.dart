import 'package:dartz/dartz.dart';
import 'package:egy_go/Core/error/failure.dart';
import 'package:egy_go/features/auth/data/model/models_request/verify_reset_code_request.dart';
import 'package:egy_go/features/auth/data/model/models_response/verify_reset_code_model.dart';
import 'package:egy_go/features/auth/domain/repo/auth_repo.dart';

class VerifyResetCodeUseCase {
  final AuthRepo authRepo;
  VerifyResetCodeUseCase(this.authRepo);
  Future<Either<Failure, VerifyResetCodeModel>> call({
    required VerifyResetCodeRequest request,
  }) async {
    return await authRepo.verifyResetCode(request);
  }
}
