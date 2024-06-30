import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? photoUrl;
  final String? token;

  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
    this.photoUrl,
    this.token,
  });

  @override
  List<Object?> get props => [id, email, name, photoUrl, token];
}
