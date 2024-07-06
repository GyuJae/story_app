import 'package:get_it/get_it.dart';
import 'package:story_app/features/authentication/data/repository/firebase_authentication_repository.dart';
import 'package:story_app/features/authentication/domain/repository/authentication_repository.dart';
import 'package:story_app/features/authentication/domain/usecases/create_user_with_email_password.dart';
import 'package:story_app/features/authentication/domain/usecases/get_current_user.dart';
import 'package:story_app/features/authentication/domain/usecases/login_user_with_email_password.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerLazySingleton<CreateUserWithEmailPassword>(
    () => CreateUserWithEmailPassword(
      sl(),
    ),
  );

  sl.registerLazySingleton<LoginUserWithEmailPassword>(
    () => LoginUserWithEmailPassword(
      sl(),
    ),
  );

  sl.registerLazySingleton<GetCurrentUser>(
    () => GetCurrentUser(
      sl(),
    ),
  );

  sl.registerLazySingleton<AuthenticationRepository>(
    () => FirebaseAuthenticationRepository(),
  );
}
