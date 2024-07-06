import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_app/features/authentication/presentations/provider/get_current_user.dart';

class MoodTrackerHomePage extends ConsumerWidget {
  static const String routePath = '/mood-tracker';
  static const String routeName = 'mood-tracker-home-page';

  const MoodTrackerHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(getCurrentUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Tracker'),
      ),
      body: Center(
        child: userAsyncValue.when(
          data: (user) {
            return Text('Welcome ${user?.email}');
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) {
            return Text('Error: $error');
          },
        ),
      ),
    );
  }
}
