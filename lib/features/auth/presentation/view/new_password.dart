import 'package:egy_go/features/auth/presentation/view/widget/new_password_body.dart';
import 'package:flutter/material.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(body: NewPasswordBody(email: email));
  }
}
