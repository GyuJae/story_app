import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:story_app/core/constants/sizes.dart';
import 'package:story_app/core/utils/validators.dart';
import 'package:story_app/features/authentication/domain/repository/authentication_repository.dart';
import 'package:story_app/features/authentication/presentations/provider/login_user_with_email_password.dart';

class EmailForm extends ConsumerStatefulWidget {
  const EmailForm({
    super.key,
  });

  @override
  createState() => EmailFormState();
}

class EmailFormState extends ConsumerState<EmailForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final input = LoginUserWithEmailAndPasswordParams(
      email: _emailController.text,
      password: _passwordController.text,
    );
    final result =
        await ref.read(loginUserWithEmailPasswordProvider).execute(input);

    result.fold((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.getMessage()),
        ),
      );
    }, (user) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('로그인 성공'),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _emailController,
            validator: Validators.email,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
              hintText: '이메일',
              filled: true,
              fillColor: Theme.of(context).inputDecorationTheme.fillColor,
            ),
          ),
          const Gap(
            Sizes.size14,
          ),
          TextFormField(
            controller: _passwordController,
            validator: Validators.password,
            obscureText: true,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
              hintText: '비밀번호',
              filled: true,
              fillColor: Theme.of(context).inputDecorationTheme.fillColor,
            ),
          ),
          const Gap(
            Sizes.size14,
          ),
          GestureDetector(
            onTap: _submit,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(Sizes.size4),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Sizes.size16,
                ),
                child: Text(
                  "로그인",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
