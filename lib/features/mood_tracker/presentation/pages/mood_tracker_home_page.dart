import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/core/constants/sizes.dart';
import 'package:story_app/core/use_case/use_case.dart';
import 'package:story_app/features/authentication/presentations/pages/login/login_page.dart';
import 'package:story_app/features/authentication/presentations/provider/sign_out.dart';

class MoodTrackerHomePage extends ConsumerWidget {
  static const String routePath = '/mood-tracker';
  static const String routeName = 'mood-tracker-home-page';

  const MoodTrackerHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Tracker'),
      ),
      body: Column(
        children: [
          const Gap(Sizes.size20),
          // TODO: Remove
          CupertinoButton.filled(
            onPressed: () async {
              await ref.read(signOutProvider).execute(NoParams()).then(
                (_) {
                  context.goNamed(LoginPage.routeName);
                },
              );
            },
            child: const Text('Sign Out'),
          )
        ],
      ),
    );
  }
}
