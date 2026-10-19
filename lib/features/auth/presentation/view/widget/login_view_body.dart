import 'package:dio/dio.dart';
import 'package:egy_go/Core/Api/dio_consumer.dart';
import 'package:egy_go/Core/function/snack_bar_message.dart';
import 'package:egy_go/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:egy_go/features/auth/data/model/models_request/login_request.dart';
import 'package:egy_go/features/auth/data/repo/auth_repo_impl.dart';
import 'package:egy_go/features/auth/domain/use_case/login_use_case.dart';
import 'package:egy_go/features/auth/presentation/view/forget_password_view.dart';
import 'package:egy_go/features/auth/presentation/view/sign_up_view.dart';
import 'package:egy_go/features/auth/presentation/view/widget/social_icon.dart';
import 'package:egy_go/features/auth/presentation/view_manager/Login_cubit/login_cubit.dart';
import 'package:egy_go/features/auth/presentation/view_manager/Login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/utilities/styles.dart';
import '../../../../../Core/widget/custom_button.dart';
import '../../../../../Core/widget/custom_text_field.dart';
import 'build_label.dart';
import 'custom_divider_with_text.dart';
import 'custom_rich_text.dart';

// ignore: must_be_immutable
class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => LoginCubit(
        LoginUseCase(
          AuthRepoImpl(
            authBaseRemoteDataSource: AuthRemoteDataSource(
              DioConsumer(dio: Dio()),
            ),
          ),
        ),
      ),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            snackBarMessage(
              context: context,
              text: state.error,
              backgroundColor: Colors.red,
            );
          } else if (state is LoginSuccess) {
            snackBarMessage(
              context: context,
              backgroundColor: Colors.green,
              text: "Login Success",
            );
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: height * 0.08),
                    const SizedBox(height: 10),
                    Image.asset(
                      'assets/images/Frame 33.png',
                      fit: BoxFit.contain,
                      height: height * 0.14,
                      width: double.infinity,
                    ),
                    SizedBox(height: height * 0.02),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 28,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Text('Welcome back', style: Styles.style22),
                                const SizedBox(height: 6),
                                Text(
                                  'Continue your Egyptian journey',
                                  style: Styles.style14,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: height * 0.03),
                          const BuildLabel(text: "Email Address"),
                          SizedBox(height: height * 0.01),
                          CustomTextField(
                            controller: emailController,
                            hintText: "Enter your email",
                            prefixIcon: const Icon(Icons.email_outlined),
                          ),
                          SizedBox(height: height * 0.02),
                          const BuildLabel(text: "Password"),
                          SizedBox(height: height * 0.01),
                          CustomTextField(
                            controller: passwordController,
                            hintText: "Enter your password",
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: const Icon(
                              Icons.visibility_off_outlined,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgetPasswordView(),
                                  ),
                                );
                              },
                              child: const Text(
                                'forgot password ?',
                                style: TextStyle(color: Color(0xff0A3030)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          state is LoginLoading
                              ? const Center(child: CircularProgressIndicator())
                              : CustomButton(
                                  text: "log in",
                                  color: const Color(0xFFC89B2C),
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      BlocProvider.of<LoginCubit>(
                                        context,
                                      ).login(
                                        LoginRequest(
                                          email: emailController.text.trim(),
                                          password: passwordController.text
                                              .trim(),
                                        ),
                                      );
                                    }
                                  },
                                ),
                          const SizedBox(height: 16),
                          CustomRichText(
                            text1: "Don't have an account ? ",
                            text2: "Sign Up",
                            onTapText2: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpView(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 24),
                          const CustomDividerWithText(),
                          const SizedBox(height: 18),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SocialIcon(icon: 'assets/images/google.png'),
                              SizedBox(width: 18),
                              SocialIcon(icon: 'assets/images/iphone.png'),
                              SizedBox(width: 18),
                              SocialIcon(icon: 'assets/images/facebook.png'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
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
