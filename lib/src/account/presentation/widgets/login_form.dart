import 'package:ecore/core/common/widgets/inputs/i_text_field.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class LoginForm extends StatefulWidget {
  const LoginForm(
      {required this.emailController,
        required this.passwordController,
        required this.formKey,
        super.key});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Column(
          children: [
            ITextField(
              controller: widget.emailController,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 24,
            ),
            ITextField(
              controller: widget.passwordController,
              hintText: 'Password',
              obscureText: obscurePassword,
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: IconButton(
                  onPressed: () =>
                      setState(() {
                        obscurePassword = !obscurePassword;
                      }),
                  icon: Icon( obscurePassword? IconlyLight.show: IconlyLight.hide)
              ),
            ),
          ],
        ));
  }
}
