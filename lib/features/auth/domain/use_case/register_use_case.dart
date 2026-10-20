import 'package:dartz/dartz.dart';
import 'package:egy_go/features/auth/data/model/models_request/register_request.dart';
import '../../../../Core/error/failure.dart';
import '../../data/model/models_response/auth_model.dart';
import '../repo/auth_repo.dart';

class RegisterUseCase {
  final AuthRepo authRepo;
  RegisterUseCase(this.authRepo);
  Future<Either<Failure, AuthModel>> call({
    required RegisterRequest request,
  }) async {
    return await authRepo.userRegister(request);
  }
}
