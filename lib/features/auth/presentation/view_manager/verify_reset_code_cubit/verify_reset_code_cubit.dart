import 'package:egy_go/features/auth/data/model/models_request/verify_reset_code_request.dart';
import 'package:egy_go/features/auth/domain/use_case/verify_reset_code_use_case.dart';
import 'package:egy_go/features/auth/presentation/view_manager/verify_reset_code_cubit/verify_reset_code_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyResetCodeCubit extends Cubit<VerifyResetCodeState> {
  final VerifyResetCodeUseCase verifyResetCodeUseCase;

  VerifyResetCodeCubit({required this.verifyResetCodeUseCase})
    : super(VerifyResetCodeInitial());

  Future<void> verifyResetCode({
    required String email,
    required String code,
  }) async {
    emit(VerifyResetCodeLoading());
    final request = VerifyResetCodeRequest(email: email, code: code);
    final result = await verifyResetCodeUseCase(request: request);
    result.fold(
      (failure) => emit(VerifyResetCodeFailure(errorMessage: failure.message)),
      (response) =>
          emit(VerifyResetCodeSuccess(verifyResetCodeModel: response)),
    );
  }
}
