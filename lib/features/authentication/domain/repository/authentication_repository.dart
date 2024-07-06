import 'package:dartz/dartz.dart';
import 'package:story_app/core/errors/failure.dart';
import 'package:story_app/features/authentication/domain/entities/user.dart';

class CreateUserWithEmailAndPasswordParams {
  final String email;
  final String password;

  CreateUserWithEmailAndPasswordParams({
    required this.email,
    required this.password,
  });
}

class LoginUserWithEmailAndPasswordParams {
  final String email;
  final String password;

  LoginUserWithEmailAndPasswordParams({
    required this.email,
    required this.password,
  });
}

abstract class AuthenticationRepository {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    CreateUserWithEmailAndPasswordParams params,
  );

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    LoginUserWithEmailAndPasswordParams params,
  );

  Future<Either<Failure, UserEntity>> getUser();
}
