import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_app/core/use_case/use_case.dart';
import 'package:story_app/features/authentication/domain/usecases/sign_out.dart';
import 'package:story_app/injection_container.dart';

final signOutProvider = Provider<UseCase<void, NoParams>>((ref) {
  return sl<SignOut>();
});
