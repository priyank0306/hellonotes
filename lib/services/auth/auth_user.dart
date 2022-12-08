import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/cupertino.dart';

@immutable
class AuthUser {
  final bool isEmailVerfied;

  const AuthUser({required this.isEmailVerfied});
  factory AuthUser.fromFirebase(User user) => AuthUser(
        isEmailVerfied: user.emailVerified,
      );
}
