import 'package:dartz/dartz.dart';
import 'package:story_app/core/errors/failure.dart';
import 'package:story_app/features/authentication/domain/entities/user.dart';

class AuthEmailAndPasswordParams {
  final String email;
  final String password;

  AuthEmailAndPasswordParams({
    required this.email,
    required this.password,
  });
}

abstract class AuthenticationRepository {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    AuthEmailAndPasswordParams params,
  );

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    AuthEmailAndPasswordParams params,
  );

  Future<Either<Failure, UserEntity>> getUser();

  Future<Either<Failure, void>> signOut();
}
