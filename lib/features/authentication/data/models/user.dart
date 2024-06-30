import 'package:story_app/features/authentication/domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.name,
    super.photoUrl,
    super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      photoUrl: json['photoUrl'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
      'token': token,
    };
  }
}
