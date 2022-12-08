import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/cupertino.dart';
@immutable
class AuthUser{
  final bool isEmailVerfied;

  const AuthUser(this.isEmailVerfied);
  factory AuthUser.fromFirebase(User user)=>AuthUser(user.emailVerified);
}
