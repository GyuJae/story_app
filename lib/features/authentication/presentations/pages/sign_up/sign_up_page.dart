import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/core/constants/sizes.dart';
import 'package:story_app/features/authentication/presentations/provider/create_user_with_email_password.dart';
import 'package:story_app/features/authentication/presentations/widgets/email_form.dart';

class SignUpPage extends StatelessWidget {
  static const String routePath = '/sign-up';
  static const String routeName = 'sign-up';

  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottom(context),
    );
  }

  SafeArea _buildBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Gap(Sizes.size36),
            const Text(
              '회원가입',
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(Sizes.size36),
            EmailForm(
              emailAndPasswordProvider: createUserWithEmailAndPasswordProvider,
            ),
          ],
        ),
      ),
    );
  }

  BottomAppBar _buildBottom(BuildContext context) {
    void onLoginPage() {
      context.pop();
    }

    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("이미 계정이 있으신가요?"),
          const Gap(Sizes.size6),
          GestureDetector(
            onTap: onLoginPage,
            child: Text(
              "로그인",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
