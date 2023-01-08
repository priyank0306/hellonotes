import 'dart:math';

import 'package:hellonotes/services/auth/auth_exceptions.dart';
import 'package:hellonotes/services/auth/auth_provider.dart';
import 'package:hellonotes/services/auth/auth_service.dart';
import 'package:hellonotes/services/auth/auth_user.dart';
import 'package:test/test.dart';

void main() {
  group('Mock Authentication', () {
    final provider = MockAuthProvider();
    test('Should not be initialized to begin with', () {
      expect(
        provider._isIntialized,
        false,
      );
    });
    test('Cannot log out if not initialized', () {
      expect(
        provider.logOut(),
        throwsA(const TypeMatcher<NotInitializedException>()),
      );
    });
    test('Should be able to initialized', () async {
      await provider.initialize();
      expect(provider._isIntialized, true);
    });
    test('User should be null after intialization', () {
      expect(provider.currentUser, null);
    });
    test(
      'Should be able to initialized in less than 2 seconds ',
      () async {
        await provider.initialize();
        expect(provider._isIntialized, true);
      },
      timeout: const Timeout(Duration(seconds: 2)),
    );
    test('Create user should delegate to logIn function', () async {
      final badEmailUser = provider.createUser(
        email: 'foo@bar.com',
        password: 'fdasdsdsa',
      );
      expect(badEmailUser,
          throwsA(const TypeMatcher<UserNotFoundAuthException>()));
      final badPasswordUser = provider.createUser(
        email: 'dasaa@gmail.com',
        password: 'foobar',
      );
      expect(badPasswordUser,
          throwsA(const TypeMatcher<WrongPasswordAuthException>()));
      final user = await provider.createUser(
        email: 'foo',
        password: 'bar',
      );
      expect(provider.currentUser, user);
      expect(user.isEmailVerfied, false);
    });
    test('Logged in user should be able to get verified', () async {
      await provider.sendEmailVerification();
      final user = provider.currentUser;
      expect(user, isNotNull);
      expect(user!.isEmailVerfied, true);
    });
    test('Should be able to logOut and logIn again', () async {
      await provider.logOut();
      await provider.logIn(
        email: 'email',
        password: 'password',
      );
      
      final user = provider.currentUser;
      expect(user, isNotNull);
    });
  });
}

class NotInitializedException implements Exception {}

class MockAuthProvider implements AuthProvider {
  var _isIntialized = false;
  AuthUser? _user;
  bool get isIntialized => _isIntialized;
 String get userEmail=>AuthService.firebase().currentUser!.email!;
  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) async {
    if (isIntialized == false) throw NotInitializedException();
    await Future.delayed(const Duration(seconds: 1));
    return logIn(
      email: email,
      password: password,
    );
  }

  @override
  AuthUser? get currentUser => _user;

  @override
  Future<void> initialize() async {
    await Future.delayed(const Duration(seconds: 1));
    _isIntialized = true;
  }

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) {
    if (isIntialized == false) throw NotInitializedException();
    if (email == 'foo@bar.com') throw UserNotFoundAuthException();
    if (password == 'foobar') throw WrongPasswordAuthException();
    const user = AuthUser(isEmailVerfied: false, email: "priyankmehta6788@gmail.com");
    _user = user;
    return Future.value(user);
  }

  @override
  Future<void> logOut() async {
    if (isIntialized == false) throw NotInitializedException();
    if (_user == null) throw UserNotFoundAuthException();
    await Future.delayed(const Duration(seconds: 1));
    _user = null;
  }

  @override
  Future<void> sendEmailVerification() async {
    if (isIntialized == false) throw NotInitializedException();
    if (_user == null) throw UserNotFoundAuthException();
    const newUser = AuthUser(isEmailVerfied: true, email: "priyankmehta6788@gmail.com");
    _user = newUser;
  }
}
