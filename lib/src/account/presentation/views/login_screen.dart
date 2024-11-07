import '../../../../core/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/gradient_background.dart';
import '../../../../core/common/widgets/rounded_button.dart';
import '../../../../core/configs/app_config.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/utils/core_utils.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController(text: 'demo@inos.vn');
  final passwordController = TextEditingController(text: 'Lq121212');
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        if (state is AuthError) {
          CoreUtils.showSnackBar(context, state.message);
        } else if (state is AuthSignedIn) {
          CoreUtils.showSnackBar(context,
              'welcome ${state.session.user.Name} ! ${AppConfig.current().appId}');
          context.sessionProvider.initSession(state.session);
          Navigator.pushReplacementNamed(context, '/select-network');
        }
      }, builder: (context, state) {
        return GradientBackground(
          image: MediaRes.backgroundImg,
          child: SafeArea(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                Text(
                  'Welcome to ecore system',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Log in to your account',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    Baseline(
                      baseline: 100,
                      baselineType: TextBaseline.alphabetic,
                      child: TextButton(
                          onPressed: () {
                            //Navigator.pushReplacementNamed(context, '/signup');
                          },
                          child: const Text('Register account?')),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                LoginForm(
                    emailController: emailController,
                    passwordController: passwordController,
                    formKey: formKey),
                const SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        // Navigator.pushReplacementNamed(
                        //     context, '/forgot-password');
                      },
                      child: const Text('Forgot password?')),
                ),
                const SizedBox(
                  height: 25,
                ),
                if (state is AuthStateLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  RoundedButton(
                    label: 'Sign in',
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (formKey.currentState!.validate()) {
                        context.read<AuthCubit>().login(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim());
                      }
                    },
                  )
              ],
            ),
          ),
        );
      }),
    );
  }
}
