import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.email, required super.uId, required super.name});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
        email: user.email!, uId: user.uid, name: user.displayName ?? '');
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(email: map['email'], uId: map['uId'], name: map['name']);
  }
}
