import 'package:dartz/dartz.dart';
import 'package:story_app/core/errors/failure.dart';
import 'package:story_app/features/authentication/domain/dtos/create_user_with_email_and_password.dart';
import 'package:story_app/features/authentication/domain/entities/user.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    CreateUserWithEmailAndPasswordParams params,
  );

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> getUser();
}
