import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/core/constants/sizes.dart';
import 'package:story_app/features/authentication/presentations/pages/sign_up/sign_up_page.dart';
import 'package:story_app/features/authentication/presentations/provider/login_user_with_email_password.dart';
import 'package:story_app/features/authentication/presentations/widgets/email_form.dart';

class LoginPage extends StatelessWidget {
  static const String routePath = '/login';
  static const String routeName = 'Login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: _buildBody(),
        bottomNavigationBar: _buildBottom(context),
      ),
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
              '로그인',
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(Sizes.size36),
            EmailForm(
              emailAndPasswordProvider: loginUserWithEmailPasswordProvider,
            ),
            const Gap(Sizes.size14),
          ],
        ),
      ),
    );
  }

  BottomAppBar _buildBottom(BuildContext context) {
    void onSignUpPage() {
      context.pushNamed(SignUpPage.routeName);
    }

    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("아직 계정이 없으신가요?"),
          const Gap(Sizes.size6),
          GestureDetector(
            onTap: onSignUpPage,
            child: Text(
              "회원가입",
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
