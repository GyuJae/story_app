enum EnumFirebaseAuthFailure implements Comparable<EnumFirebaseAuthFailure> {
  invalidEmail(code: 'invalid-email', message: '이메일 주소가 올바르지 않습니다.'),
  userDisabled(code: 'user-disabled', message: '사용 중지된 계정입니다.'),
  userNotFound(code: 'user-not-found', message: '사용자를 찾을 수 없습니다.'),
  wrongPassword(code: 'wrong-password', message: '비밀번호가 올바르지 않습니다.'),
  emailAlreadyInUse(
      code: 'email-already-in-use', message: '이미 사용 중인 이메일 주소입니다.'),
  operationNotAllowed(
      code: 'operation-not-allowed', message: '이메일/비밀번호 계정이 활성화되어 있지 않습니다.'),
  weakPassword(code: 'weak-password', message: '비밀번호가 너무 약합니다.'),
  unknown(code: 'unknown', message: '계정에 문제가 발생했습니다. 관리자에게 문의해주세요.');

  const EnumFirebaseAuthFailure({
    required this.code,
    required this.message,
  });

  final String code;
  final String message;

  static EnumFirebaseAuthFailure fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return EnumFirebaseAuthFailure.invalidEmail;
      case 'user-disabled':
        return EnumFirebaseAuthFailure.userDisabled;
      case 'user-not-found':
        return EnumFirebaseAuthFailure.userNotFound;
      case 'wrong-password':
        return EnumFirebaseAuthFailure.wrongPassword;
      case "email-already-in-use":
        return EnumFirebaseAuthFailure.emailAlreadyInUse;
      case "operation-not-allowed":
        return EnumFirebaseAuthFailure.operationNotAllowed;
      case "weak-password":
        return EnumFirebaseAuthFailure.weakPassword;
      default:
        return EnumFirebaseAuthFailure.unknown;
    }
  }

  @override
  int compareTo(EnumFirebaseAuthFailure other) {
    return code.compareTo(other.code);
  }
}
