import 'package:dartz/dartz.dart';
import 'package:story_app/core/errors/failure.dart';
import 'package:story_app/features/authentication/domain/entities/user.dart';
import 'package:story_app/features/authentication/domain/repository/authentication_repository.dart';

class GetCurrentUser {
  final AuthenticationRepository _authRepository;

  GetCurrentUser({
    required AuthenticationRepository authRepository,
  }) : _authRepository = authRepository;

  Either<Failure, UserEntity?> get user => _authRepository.getUser();
  bool get isLoggedIn => user.fold(
        (_) => false,
        (user) => user != null,
      );
}
