import 'package:equatable/equatable.dart';
import 'package:story_app/core/constants/firebase_auth.dart';

abstract class Failure extends Equatable {
  final String? message;

  const Failure({this.message});

  @override
  List<Object?> get props => [message];

  String getMessage();
}

class FirebaseAuthFailure extends Failure {
  final EnumFirebaseAuthFailure firebaseAuthFailure;

  const FirebaseAuthFailure({
    required this.firebaseAuthFailure,
  });

  @override
  String getMessage() {
    return firebaseAuthFailure.message;
  }

  factory FirebaseAuthFailure.ofCode(String code) {
    return FirebaseAuthFailure(
      firebaseAuthFailure: EnumFirebaseAuthFailure.fromCode(code),
    );
  }

  factory FirebaseAuthFailure.ofUnknown() {
    return const FirebaseAuthFailure(
      firebaseAuthFailure: EnumFirebaseAuthFailure.unknown,
    );
  }
}

class UnknownFailure extends Failure {
  const UnknownFailure({
    super.message,
  });

  @override
  String getMessage() {
    return message ?? '알 수 없는 오류가 발생했습니다.';
  }
}
