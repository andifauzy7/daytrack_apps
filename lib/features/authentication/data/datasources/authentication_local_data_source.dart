import 'dart:convert';

import 'package:daytrack_apps/core/error/exception.dart';
import 'package:daytrack_apps/features/authentication/data/models/user_model.dart';
import 'package:daytrack_apps/features/authentication/data/models/user_sign_in_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const CACHED_LOGIN = 'CACHED_LOGIN';
// ignore: constant_identifier_names
const CACHED_ONBOARDING = 'CACHED_ONBOARDING';
// ignore: constant_identifier_names
const CACHED_USER = 'CACHED_USER';

abstract class AuthenticationLocalDataSource {
  Future<bool> getLoginSession();
  Future<bool> cacheLoginSession(UserSignInModel userSignInModel);
  Future<bool> getOnboardingSession();
  Future<bool> cacheOnboardingSession();
  Future<bool> cacheUserData(UserModel userModel);
  Future<UserModel> getUserData();
}

class AuthenticationLocalDataSourceImpl
    implements AuthenticationLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthenticationLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<bool> cacheLoginSession(UserSignInModel userSignInModel) async {
    final cacheLoginResult = sharedPreferences.setBool(CACHED_LOGIN, true);
    return Future.value(cacheLoginResult);
  }

  @override
  Future<bool> getLoginSession() {
    final loginSession = sharedPreferences.getBool(CACHED_LOGIN);

    if (loginSession == null) {
      throw CacheException();
    } else {
      return Future.value(loginSession);
    }
  }

  @override
  Future<bool> getOnboardingSession() {
    final onboardSession = sharedPreferences.getBool(CACHED_ONBOARDING);

    if (onboardSession == null) {
      throw CacheException();
    } else {
      return Future.value(onboardSession);
    }
  }

  @override
  Future<bool> cacheOnboardingSession() async {
    final cacheOnboardResult =
        sharedPreferences.setBool(CACHED_ONBOARDING, true);
    return Future.value(cacheOnboardResult);
  }

  @override
  Future<bool> cacheUserData(UserModel userModel) {
    final cacheUser = sharedPreferences.setString(
      CACHED_USER,
      jsonEncode(
        userModel.toJson(),
      ),
    );
    return Future.value(cacheUser);
  }

  @override
  Future<UserModel> getUserData() {
    final getUserResult = sharedPreferences.getString(CACHED_USER);
    if (getUserResult == null) {
      throw CacheException();
    } else {
      final user = UserModel.fromJson(
        jsonDecode(getUserResult),
      );
      return Future.value(user);
    }
  }
}
