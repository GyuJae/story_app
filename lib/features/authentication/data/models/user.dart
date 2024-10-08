import 'package:story_app/features/authentication/domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    super.photoUrl,
    super.token,
  });

  factory UserModel.createByEmail({
    required String email,
    required String id,
  }) {
    return UserModel(
      id: id,
      email: email,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'photoUrl': photoUrl,
      'token': token,
    };
  }
}
