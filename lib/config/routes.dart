import 'package:go_router/go_router.dart';
import 'package:story_app/features/authentication/presentations/pages/login/login_page.dart';
import 'package:story_app/features/authentication/presentations/pages/sign_up/sign_up_page.dart';

final GoRouter router = GoRouter(
  initialLocation: LoginPage.routePath,
  routes: [
    GoRoute(
      path: LoginPage.routePath,
      name: LoginPage.routeName,
      builder: (_, __) => const LoginPage(),
    ),
    GoRoute(
      path: SignUpPage.routePath,
      name: SignUpPage.routeName,
      builder: (_, __) => const SignUpPage(),
    ),
  ],
);
