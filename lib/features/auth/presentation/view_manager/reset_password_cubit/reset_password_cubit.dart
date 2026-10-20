import 'package:egy_go/features/auth/data/model/models_request/reset_password_request.dart';
import 'package:egy_go/features/auth/domain/repo/auth_repo.dart';
import 'package:egy_go/features/auth/presentation/view_manager/reset_password_cubit/reset_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepo authRepo;

  ResetPasswordCubit({required this.authRepo}) : super(ResetPasswordInitial());

  Future<void> resetPassword({
    required String email,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(ResetPasswordLoading());
    final request = ResetPasswordRequest(
      email: email,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
    final result = await authRepo.resetPassword(request);
    result.fold(
      (failure) => emit(ResetPasswordFailure(errorMessage: failure.message)),
      (resetPasswordModel) =>
          emit(ResetPasswordSuccess(resetPasswordModel: resetPasswordModel)),
    );
  }
}
