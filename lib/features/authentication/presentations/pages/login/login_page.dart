import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:story_app/core/constants/sizes.dart';
import 'package:story_app/features/authentication/presentations/pages/login/email_form.dart';

class Login extends StatelessWidget {
  static const String routePath = '/login';
  static const String routeName = 'Login';

  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("아직 계정이 없으신가요?"),
            const Gap(Sizes.size6),
            GestureDetector(
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
      ),
    );
  }

  SafeArea _buildBody() {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.size18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Gap(Sizes.size36),
            Text(
              '로그인',
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Gap(Sizes.size36),
            EmailForm(),
            // or 선 만들기
            Gap(Sizes.size14),
          ],
        ),
      ),
    );
  }
}
