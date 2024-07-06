import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/features/authentication/presentations/pages/login/login_page.dart';
import 'package:story_app/features/authentication/presentations/pages/sign_up/sign_up_page.dart';
import 'package:story_app/features/authentication/presentations/provider/get_current_user.dart';
import 'package:story_app/features/mood_tracker/presentation/pages/mood_tracker_home_page.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: MoodTrackerHomePage.routePath,
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
        GoRoute(
          path: MoodTrackerHomePage.routePath,
          name: MoodTrackerHomePage.routeName,
          builder: (_, __) => const MoodTrackerHomePage(),
          redirect: (context, state) {
            final getCurrentUser = ref.read(getCurrentUserProvider);
            if (!getCurrentUser.isLoggedIn) {
              return LoginPage.routePath;
            }
            return null;
          },
        ),
      ],
    );
  },
);
