import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_app/core/use_case/use_case.dart';
import 'package:story_app/features/authentication/domain/entities/user.dart';
import 'package:story_app/features/authentication/domain/usecases/get_current_user.dart';
import 'package:story_app/injection_container.dart';

final getCurrentUserProvider = FutureProvider<UserEntity?>(
  (ref) async {
    final user = await sl<GetCurrentUser>().execute(NoParams());
    return user.fold(
      (error) {
        return null;
      },
      (user) {
        return user;
      },
    );
  },
);
