import 'package:get_it/get_it.dart';
import 'package:story_app/features/authentication/data/repository/firebase_authentication_repository.dart';
import 'package:story_app/features/authentication/domain/repository/authentication_repository.dart';
import 'package:story_app/features/authentication/domain/usecases/create_user_with_email_password.dart';
import 'package:story_app/features/authentication/domain/usecases/get_current_user.dart';
import 'package:story_app/features/authentication/domain/usecases/login_user_with_email_password.dart';
import 'package:story_app/features/authentication/domain/usecases/sign_out.dart';
import 'package:story_app/features/mood_tracker/data/repository/firebase_mood_entry_repository.dart';
import 'package:story_app/features/mood_tracker/domain/repository/mood_entry_repository.dart';
import 'package:story_app/features/mood_tracker/domain/usecases/get_current_month_mood_entries.dart';
import 'package:story_app/features/mood_tracker/domain/usecases/register_today_mood.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // authentication
  sl.registerLazySingleton<CreateUserWithEmailPassword>(
    () => CreateUserWithEmailPassword(
      authRepository: sl<AuthenticationRepository>(),
    ),
  );
  sl.registerLazySingleton<LoginUserWithEmailPassword>(
    () => LoginUserWithEmailPassword(
      authRepository: sl<AuthenticationRepository>(),
    ),
  );
  sl.registerLazySingleton<GetCurrentUser>(
    () => GetCurrentUser(
      authRepository: sl<AuthenticationRepository>(),
    ),
  );
  sl.registerLazySingleton<SignOut>(
    () => SignOut(
      authRepository: sl<AuthenticationRepository>(),
    ),
  );
  sl.registerLazySingleton<AuthenticationRepository>(
    () => FirebaseAuthenticationRepository(),
  );

  // mood tracker
  sl.registerLazySingleton<MoodEntryRepository>(
    () => FirebaseMoodEntryRepository(),
  );

  sl.registerLazySingleton<GetCurrentMonthMoodEntries>(
    () => GetCurrentMonthMoodEntries(
      moodEntryRepository: sl<MoodEntryRepository>(),
    ),
  );

  sl.registerLazySingleton<RegisterTodayMood>(
    () => RegisterTodayMood(
      repository: sl<MoodEntryRepository>(),
    ),
  );
}
