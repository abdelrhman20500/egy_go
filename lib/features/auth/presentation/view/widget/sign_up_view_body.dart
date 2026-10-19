import 'package:dio/dio.dart';
import 'package:egy_go/Core/Api/dio_consumer.dart';
import 'package:egy_go/Core/function/snack_bar_message.dart';
import 'package:egy_go/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:egy_go/features/auth/data/model/models_request/register_request.dart';
import 'package:egy_go/features/auth/data/repo/auth_repo_impl.dart';
import 'package:egy_go/features/auth/domain/use_case/register_use_case.dart';
import 'package:egy_go/features/auth/presentation/view/widget/sign_up_stack.dart';
import 'package:egy_go/features/auth/presentation/view_manager/register_cubit/register_cubit.dart';
import 'package:egy_go/features/auth/presentation/view_manager/register_cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/utilities/styles.dart';
import '../../../../../Core/widget/custom_button.dart';
import '../../../../../Core/widget/custom_text_field.dart';
import 'build_label.dart';
import 'custom_rich_text.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) {
        return RegisterCubit(
          RegisterUseCase(
            AuthRepoImpl(
              authBaseRemoteDataSource: AuthRemoteDataSource(
                DioConsumer(dio: Dio()),
              ),
            ),
          ),
        );
      },
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterFailure) {
            snackBarMessage(
              context: context,
              text: state.errMessage,
              backgroundColor: Colors.red,
            );
          } else if (state is RegisterSuccess) {
            snackBarMessage(
              context: context,
              backgroundColor: Colors.green,
              text: "Sign Up Success",
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
                    const SignUpStack(),
                    Container(
                      width: double.infinity,
                      color: const Color(0xFFFFFBF5),
                      padding: const EdgeInsets.fromLTRB(24, 4, 24, 30),
                      child: Column(
                        children: [
                          Text('Create Account', style: Styles.style22),
                          Text(
                            'Start your Egyptian journey',
                            style: Styles.style14.copyWith(
                              color: const Color(0xFFC8A84B),
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          const BuildLabel(text: "Full Name"),
                          CustomTextField(
                            controller: nameController,
                            hintText: "Enter your full name",
                            prefixIcon: const Icon(Icons.person_outline),
                          ),
                          const SizedBox(height: 14),
                          const BuildLabel(text: "Email Address"),
                          CustomTextField(
                            controller: emailController,
                            hintText: "Enter your Email",
                            prefixIcon: const Icon(Icons.email_outlined),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 14),
                          const BuildLabel(text: "Phone Number"),
                          CustomTextField(
                            controller: phoneController,
                            hintText: "Phone Number",
                            prefixIcon: const Icon(Icons.phone),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 14),
                          const BuildLabel(text: "Password"),
                          CustomTextField(
                            controller: passwordController,
                            hintText: "Create a password",
                            prefixIcon: const Icon(Icons.lock_outlined),
                            keyboardType: TextInputType.text,
                            isSecure: true,
                          ),
                          const SizedBox(height: 14),
                          const BuildLabel(text: "Confirm Password"),
                          CustomTextField(
                            controller: confirmPasswordController,
                            hintText: "Confirm your password",
                            prefixIcon: const Icon(Icons.lock_outlined),
                            keyboardType: TextInputType.text,
                            isSecure: true,
                          ),
                          const SizedBox(height: 22),
                          state is RegisterLoading
                              ? const Center(child: CircularProgressIndicator())
                              : CustomButton(
                                  text: "Sign Up",
                                  color: const Color(0xFFC89B2C),
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff0A3030),
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      BlocProvider.of<RegisterCubit>(
                                        context,
                                      ).userRegister(
                                        RegisterRequest(
                                          fullName: nameController.text.trim(),
                                          email: emailController.text.trim(),
                                          phone: phoneController.text.trim(),
                                          password: passwordController.text
                                              .trim(),
                                          confirmPassword:
                                              confirmPasswordController.text
                                                  .trim(),
                                        ),
                                      );
                                    }
                                  },
                                ),
                          const SizedBox(height: 16),
                          const CustomRichText(
                            text1: "Already have an account? ",
                            text2: "Login",
                          ),
                        ],
                      ),
                    ),
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
