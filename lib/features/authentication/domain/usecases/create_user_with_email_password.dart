import 'package:dartz/dartz.dart';
import 'package:story_app/core/errors/failure.dart';
import 'package:story_app/core/use_case/use_case.dart';
import 'package:story_app/features/authentication/domain/entities/user.dart';
import 'package:story_app/features/authentication/domain/repository/authentication_repository.dart';

class CreateUserWithEmailPassword
    implements UseCase<UserEntity, AuthEmailAndPasswordParams> {
  final AuthenticationRepository repository;

  CreateUserWithEmailPassword(this.repository);

  @override
  Future<Either<Failure, UserEntity>> execute(
    AuthEmailAndPasswordParams params,
  ) async {
    return repository.createUserWithEmailAndPassword(params);
  }
}
