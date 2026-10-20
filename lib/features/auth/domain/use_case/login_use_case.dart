import 'package:dartz/dartz.dart';
import 'package:egy_go/Core/error/failure.dart';
import 'package:egy_go/features/auth/data/model/models_request/login_request.dart';
import 'package:egy_go/features/auth/data/model/models_response/auth_model.dart';
import 'package:egy_go/features/auth/domain/repo/auth_repo.dart';

class LoginUseCase {
  final AuthRepo authRepo;
  LoginUseCase(this.authRepo);
  Future<Either<Failure, AuthModel>> call({
    required LoginRequest request,
  }) async {
    return await authRepo.userLogin(request);
  }
}
