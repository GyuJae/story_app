import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_app/core/use_case/use_case.dart';
import 'package:story_app/features/authentication/domain/entities/user.dart';
import 'package:story_app/features/authentication/domain/repository/authentication_repository.dart';
import 'package:story_app/features/authentication/domain/usecases/login_user_with_email_password.dart';
import 'package:story_app/injection_container.dart';

final loginUserWithEmailPasswordProvider =
    Provider<UseCase<UserEntity, AuthEmailAndPasswordParams>>(
  (ref) {
    return sl<LoginUserWithEmailPassword>();
  },
);
