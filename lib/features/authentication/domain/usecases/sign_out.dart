import 'package:dartz/dartz.dart';
import 'package:story_app/core/errors/failure.dart';
import 'package:story_app/core/use_case/use_case.dart';
import 'package:story_app/features/authentication/domain/repository/authentication_repository.dart';

class SignOut extends UseCase<void, NoParams> {
  final AuthenticationRepository authRepository;

  SignOut({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> execute(NoParams params) async {
    return await authRepository.signOut();
  }
}
