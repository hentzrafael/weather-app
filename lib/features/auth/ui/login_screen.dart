import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/app/router/routes.dart';
import 'package:weather_app/features/auth/ui/viewmodels/login_viewmodel.dart';
import 'package:weather_app/features/auth/ui/widgets/email_input.dart';
import 'package:weather_app/features/auth/ui/widgets/password_input.dart';

class LoginScreen extends StatefulWidget {
  final LoginViewModel viewModel;
  const LoginScreen({super.key, required this.viewModel});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  _navigateToHome() {
    if (mounted) {
      context.go(Routes.home);
    }
  }

  void _handleLogin() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    await widget.viewModel.loginCommand.execute(
      emailController.text,
      passwordController.text,
    );
    if (widget.viewModel.loginCommand.completed &&
        !widget.viewModel.loginCommand.error) {
      _navigateToHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUnfocus,
                      key: formKey,
                      child: Column(
                        spacing: 12,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 300,
                              maxHeight: 300,
                            ),
                            child: SvgPicture.asset('assets/img/weather.svg'),
                          ),
                          EmailInput(controller: emailController),
                          PasswordInput(controller: passwordController),
                          ElevatedButton(
                            onPressed: _handleLogin,
                            child: Text('Login'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
