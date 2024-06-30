import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static const String routePath = '/login';
  static const String routeName = 'Login';

  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
    );
  }
}
