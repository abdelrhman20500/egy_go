import 'package:dartz/dartz.dart';
import 'package:egy_go/Core/error/failure.dart';
import 'package:egy_go/features/auth/data/model/models_response/forget_password_model.dart';
import 'package:egy_go/features/auth/domain/repo/auth_repo.dart';

class ForgetPasswordUseCase {
  final AuthRepo authRepo;
  ForgetPasswordUseCase(this.authRepo);
  Future<Either<Failure, ForgetPasswordModel>> call({
    required String email,
  }) async {
    return await authRepo.forgetPassword(email: email);
  }
}
