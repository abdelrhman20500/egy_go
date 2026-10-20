import 'package:dio/dio.dart';
import 'package:egy_go/Core/Api/dio_consumer.dart';
import 'package:egy_go/Core/function/snack_bar_message.dart'
    show snackBarMessage;
import 'package:egy_go/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:egy_go/features/auth/data/repo/auth_repo_impl.dart';
import 'package:egy_go/features/auth/presentation/view/login_view.dart';
import 'package:egy_go/features/auth/presentation/view_manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:egy_go/features/auth/presentation/view_manager/reset_password_cubit/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/utilities/styles.dart';
import '../../../../../Core/widget/custom_button.dart';
import '../../../../../Core/widget/custom_text_field.dart';
import 'build_label.dart';
import 'circle_icon_button.dart';
import 'custom_divider_with_text.dart';
import 'custom_rich_text.dart';

class NewPasswordBody extends StatelessWidget {
  NewPasswordBody({super.key, required this.email});

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  final String email;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => ResetPasswordCubit(
        authRepo: AuthRepoImpl(
          authBaseRemoteDataSource: AuthRemoteDataSource(
            DioConsumer(dio: Dio()),
          ),
        ),
      ),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordFailure) {
            snackBarMessage(
              context: context,
              text: state.errorMessage,
              backgroundColor: Colors.red,
            );
          } else if (state is ResetPasswordSuccess) {
            snackBarMessage(
              context: context,
              backgroundColor: Colors.green,
              text: "Password Reset Successfully",
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginView()),
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
                child: Column(
                  children: [
                    SizedBox(height: height * 0.02),
                    Row(
                      children: [
                        CircleIconButton(
                          icon: Icons.arrow_back_ios_new,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/Frame 89.png',
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: height * 0.06),
                    Text(
                      "Create New password",
                      style: Styles.style20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: height * 0.013),
                    Text(
                      "Enter your new password below to\n     update your account access",
                      style: Styles.style16,
                    ),
                    SizedBox(height: height * 0.03),
                    const BuildLabel(text: "Enter New Password"),
                    SizedBox(height: height * 0.001),
                    CustomTextField(
                      controller: newPasswordController,
                      hintText: "Enter your Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: height * 0.02),
                    const BuildLabel(text: "Confirm New Password"),
                    SizedBox(height: height * 0.001),
                    CustomTextField(
                      controller: confirmNewPasswordController,
                      hintText: "Enter your Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: height * 0.12),
                    CustomButton(
                      text: "Reset Password",
                      color: const Color(0xFFC89B2C),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        color: Color(0xff0A3030),
                      ),
                      onPressed: () {
                        BlocProvider.of<ResetPasswordCubit>(
                          context,
                        ).resetPassword(
                          email: email,
                          newPassword: newPasswordController.text.trim(),
                          confirmPassword: confirmNewPasswordController.text
                              .trim(),
                        );
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
          );
        },
      ),
    );
  }
}
