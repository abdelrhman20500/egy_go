import 'package:dio/dio.dart';
import 'package:egy_go/Core/Api/dio_consumer.dart';
import 'package:egy_go/Core/function/snack_bar_message.dart';
import 'package:egy_go/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:egy_go/features/auth/data/repo/auth_repo_impl.dart';
import 'package:egy_go/features/auth/domain/use_case/verify_reset_code_use_case.dart';
import 'package:egy_go/features/auth/presentation/view/new_password.dart';
import 'package:egy_go/features/auth/presentation/view/widget/circle_icon_button.dart';
import 'package:egy_go/features/auth/presentation/view/widget/custom_divider_with_text.dart';
import 'package:egy_go/features/auth/presentation/view/widget/custom_rich_text.dart';
import 'package:egy_go/features/auth/presentation/view_manager/verify_reset_code_cubit/verify_reset_code_cubit.dart';
import 'package:egy_go/features/auth/presentation/view_manager/verify_reset_code_cubit/verify_reset_code_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../../../Core/utilities/styles.dart';
import '../../../../Core/widget/custom_button.dart';

// ignore: must_be_immutable
class CodeVerificationView extends StatelessWidget {
  CodeVerificationView({super.key});
  String verificationCode = '';

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocProvider(
        create: (context) => VerifyResetCodeCubit(
          verifyResetCodeUseCase: VerifyResetCodeUseCase(
            AuthRepoImpl(
              authBaseRemoteDataSource: AuthRemoteDataSource(
                DioConsumer(dio: Dio()),
              ),
            ),
          ),
        ),
        child: BlocConsumer<VerifyResetCodeCubit, VerifyResetCodeState>(
          listener: (context, state) {
            if (state is VerifyResetCodeFailure) {
              snackBarMessage(
                context: context,
                text: state.errorMessage,
                backgroundColor: Colors.red,
              );
            } else if (state is VerifyResetCodeSuccess) {
              snackBarMessage(
                context: context,
                backgroundColor: Colors.green,
                text: "Code Verified Successfully",
              );
            }
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewPassword(),
                settings: RouteSettings(
                  arguments: email, // هنا بنبعت الـ email
                ),
              ),
            );
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.02),
                      Row(
                        children: [
                          CircleIconButton(
                            icon: Icons.arrow_back_ios_new,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/Frame 89.png',
                        fit: BoxFit.cover,
                        width: width * 0.4,
                        height: height * 0.16,
                      ),
                      SizedBox(height: height * 0.08),
                      Text(
                        "Code Verification",
                        style: Styles.style20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'We have sent the verification code to your\n                     email address',
                        style: Styles.style16,
                      ),
                      SizedBox(height: height * 0.05),
                      OtpTextField(
                        fieldWidth: 40.0,
                        numberOfFields: 6,
                        borderColor: const Color(0xff0A3030),
                        focusedBorderColor: const Color(0xff0A3030),
                        enabledBorderColor: const Color(0xff0A3030),
                        showFieldAsBox: true,
                        onCodeChanged: (String code) {
                          verificationCode = code;
                        },
                        onSubmit: (String code) {
                          verificationCode = code;
                          context.read<VerifyResetCodeCubit>().verifyResetCode(
                            email: email,
                            code: code,
                          );
                        }, // end onSubmit
                      ),
                      SizedBox(height: height * 0.13),
                      state is VerifyResetCodeLoading
                          ? const Center(child: CircularProgressIndicator())
                          : CustomButton(
                              text: "Verify Code",
                              color: const Color(0xFFC89B2C),
                              textStyle: const TextStyle(
                                fontSize: 18,
                                color: Color(0xff0A3030),
                              ),
                              onPressed: () {
                                if (verificationCode.length == 6) {
                                  context
                                      .read<VerifyResetCodeCubit>()
                                      .verifyResetCode(
                                        email: email,
                                        code: verificationCode,
                                      );
                                } else {
                                  snackBarMessage(
                                    context: context,
                                    text: "Please enter the full code",
                                    backgroundColor: Colors.red,
                                  );
                                }
                              },
                            ),
                      SizedBox(height: height * 0.02),
                      const CustomDividerWithText(),
                      SizedBox(height: height * 0.02),
                      const CustomRichText(
                        text1: "Didn't receive it? ",
                        text2: 'Resend Code',
                      ),
                      SizedBox(height: height * 0.12),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
