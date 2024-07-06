import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_app/core/errors/failure.dart';
import 'package:story_app/core/use_case/use_case.dart';
import 'package:story_app/features/authentication/domain/dtos/create_user_with_email_and_password.dart';
import 'package:story_app/features/authentication/domain/entities/user.dart';
import 'package:story_app/features/authentication/domain/repository/authentication_repository.dart';
import 'package:story_app/injection_container.dart';

class CreateUserWithEmailPassword
    implements UseCase<UserEntity, CreateUserWithEmailAndPasswordParams> {
  final AuthenticationRepository repository;

  CreateUserWithEmailPassword(this.repository);

  @override
  Future<Either<Failure, UserEntity>> execute(
    CreateUserWithEmailAndPasswordParams params,
  ) async {
    return repository.createUserWithEmailAndPassword(params);
  }
}

final createUserWithEmailAndPasswordProvider =
    Provider<UseCase<UserEntity, CreateUserWithEmailAndPasswordParams>>(
  (ref) {
    return sl<CreateUserWithEmailPassword>();
  },
);
