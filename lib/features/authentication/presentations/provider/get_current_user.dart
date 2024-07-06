import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_app/features/authentication/domain/usecases/get_current_user.dart';
import 'package:story_app/injection_container.dart';

final getCurrentUserProvider = Provider<GetCurrentUser>(
  (ref) {
    return sl<GetCurrentUser>();
  },
);
