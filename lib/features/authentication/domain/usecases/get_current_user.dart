import 'package:dartz/dartz.dart';
import 'package:story_app/core/errors/failure.dart';
import 'package:story_app/core/use_case/use_case.dart';
import 'package:story_app/features/authentication/domain/entities/user.dart';
import 'package:story_app/features/authentication/domain/repository/authentication_repository.dart';

class GetCurrentUser implements UseCase<UserEntity?, NoParams> {
  AuthenticationRepository authRepository;

  GetCurrentUser({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, UserEntity?>> execute(NoParams params) async {
    return authRepository.getUser();
  }
}
