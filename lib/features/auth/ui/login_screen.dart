import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/router/routes.dart';
import 'package:weather_app/features/auth/data/repositories/auth_repository.dart';
import 'package:weather_app/features/auth/ui/viewmodels/login_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  final LoginViewModel viewModel;
  const LoginScreen({super.key, required this.viewModel});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          spacing: 4,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300, maxHeight: 300),
              child: SvgPicture.asset('assets/img/weather.svg'),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                icon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                icon: Icon(Icons.password),
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await widget.viewModel.loginCommand.execute(
                  emailController.text,
                  passwordController.text,
                );
                if (widget.viewModel.loginCommand.completed &&
                    !widget.viewModel.loginCommand.error) {
                  context.go(Routes.home);
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
