import 'package:dio/dio.dart';
import 'package:egy_go/Core/Api/dio_consumer.dart';
import 'package:egy_go/Core/function/snack_bar_message.dart';
import 'package:egy_go/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:egy_go/features/auth/data/repo/auth_repo_impl.dart';
import 'package:egy_go/features/auth/domain/use_case/forget_password_use_case.dart';
import 'package:egy_go/features/auth/presentation/view/code_verification_view.dart';
import 'package:egy_go/features/auth/presentation/view/widget/build_label.dart';
import 'package:egy_go/features/auth/presentation/view/widget/circle_icon_button.dart';
import 'package:egy_go/features/auth/presentation/view/widget/custom_divider_with_text.dart';
import 'package:egy_go/features/auth/presentation/view/widget/custom_rich_text.dart';
import 'package:egy_go/features/auth/presentation/view_manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:egy_go/features/auth/presentation/view_manager/forget_password_cubit/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/utilities/styles.dart';
import '../../../../Core/widget/custom_button.dart';
import '../../../../Core/widget/custom_text_field.dart';

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocProvider(
        create: (context) => ForgetPasswordCubit(
          forgetPasswordUseCase: ForgetPasswordUseCase(
            AuthRepoImpl(
              authBaseRemoteDataSource: AuthRemoteDataSource(
                DioConsumer(dio: Dio()),
              ),
            ),
          ),
        ),
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordFailure) {
              snackBarMessage(
                context: context,
                text: state.error,
                backgroundColor: Colors.red,
              );
            } else if (state is ForgetPasswordSuccess) {
              snackBarMessage(
                context: context,
                backgroundColor: Colors.green,
                text: "Code Sent Successfully",
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CodeVerificationView(),
                  settings: RouteSettings(
                    arguments: emailController.text
                        .trim(), // هنا بنبعت الـ email
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    key: formKey,
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
                        ),
                        SizedBox(height: height * 0.08),
                        Text(
                          "Forgot password",
                          style: Styles.style20.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          'Enter your email address to to receive a\n                  verification code',
                          style: Styles.style16,
                        ),
                        SizedBox(height: height * 0.02),
                        const BuildLabel(text: "Email Address"),
                        SizedBox(height: height * 0.001),
                        CustomTextField(
                          controller: emailController,
                          hintText: "Enter your Email",
                          prefixIcon: const Icon(Icons.email_outlined),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: height * 0.18),
                        state is ForgetPasswordLoading
                            ? const Center(child: CircularProgressIndicator())
                            : CustomButton(
                                text: "Send Code",
                                color: const Color(0xFFC89B2C),
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff0A3030),
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    BlocProvider.of<ForgetPasswordCubit>(
                                      context,
                                    ).forgetPassword(
                                      email: emailController.text,
                                    );
                                  }
                                },
                              ),
                        SizedBox(height: height * 0.02),
                        const CustomDividerWithText(),
                        SizedBox(height: height * 0.02),
                        const CustomRichText(
                          text1: "Remember your password? ",
                          text2: "Login",
                        ),
                        SizedBox(height: height * 0.12),
                      ],
                    ),
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
