import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String? photoUrl;
  final String? token;

  const UserEntity({
    required this.id,
    required this.email,
    this.photoUrl,
    this.token,
  });

  @override
  List<Object?> get props => [id, email, photoUrl, token];
}
