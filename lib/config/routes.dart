import 'package:go_router/go_router.dart';
import 'package:story_app/features/authentication/presentations/pages/login/login_page.dart';

final GoRouter router = GoRouter(
  initialLocation: Login.routePath,
  routes: [
    GoRoute(
      path: Login.routePath,
      name: Login.routeName,
      builder: (_, __) => const Login(),
    ),
  ],
);
