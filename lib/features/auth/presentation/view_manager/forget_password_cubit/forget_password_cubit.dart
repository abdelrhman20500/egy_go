import 'package:egy_go/features/auth/domain/use_case/forget_password_use_case.dart';
import 'package:egy_go/features/auth/presentation/view_manager/forget_password_cubit/forget_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase forgetPasswordUseCase;

  ForgetPasswordCubit({required this.forgetPasswordUseCase})
    : super(ForgetPasswordInitial());

  Future<void> forgetPassword({required String email}) async {
    emit(ForgetPasswordLoading());
    final result = await forgetPasswordUseCase(email: email);
    result.fold(
      (failure) => emit(ForgetPasswordFailure(error: failure.message)),
      (forgetPasswordModel) =>
          emit(ForgetPasswordSuccess(forgetPasswordModel: forgetPasswordModel)),
    );
  }
}
