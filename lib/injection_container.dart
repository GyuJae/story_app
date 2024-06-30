import 'package:get_it/get_it.dart';
import 'package:story_app/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:story_app/features/authentication/domain/repository/authentication_repository.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(),
  );
}
