import 'package:egy_go/features/auth/data/model/models_request/register_request.dart';
import 'package:egy_go/features/auth/presentation/view_manager/register_cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/register_use_case.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());
  final RegisterUseCase registerUseCase;

  Future<void> userRegister(RegisterRequest request) async {
    emit(RegisterLoading());
    final result = await registerUseCase.call(request: request);
    result.fold(
      (failure) {
        emit(RegisterFailure(failure.message));
      },
      (authModel) {
        emit(RegisterSuccess(authModel: authModel));
      },
    );
  }
}
