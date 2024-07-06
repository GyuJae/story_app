import 'package:dartz/dartz.dart';
import 'package:story_app/core/errors/failure.dart';
import 'package:story_app/features/authentication/data/models/user.dart';
import 'package:story_app/features/authentication/domain/dtos/create_user_with_email_and_password.dart';
import 'package:story_app/features/authentication/domain/entities/user.dart';
import 'package:story_app/features/authentication/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      CreateUserWithEmailAndPasswordParams params) {
    final user = UserModel(
      id: "1",
      email: params.email,
    );

    return Future.value(Right(user));
  }

  @override
  Future<Either<Failure, UserEntity>> getUser() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }
}
