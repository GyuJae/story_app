import 'package:get_it/get_it.dart';
import 'package:story_app/features/authentication/data/repository/firebase_authentication_repository.dart';
import 'package:story_app/features/authentication/domain/repository/authentication_repository.dart';
import 'package:story_app/features/authentication/domain/usecases/create_user_with_email_password.dart';
import 'package:story_app/features/authentication/domain/usecases/get_current_user.dart';
import 'package:story_app/features/authentication/domain/usecases/login_user_with_email_password.dart';
import 'package:story_app/features/authentication/domain/usecases/sign_out.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
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
}
