import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class AuthenticationTextTheme {
  AuthenticationTextTheme._();

  // Splash Page
  static const headlineText = TextStyle(
    fontSize: 32,
    fontFamily: FontFamily.montserrat,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  static const versionText = TextStyle(
    fontFamily: FontFamily.inter,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  // Onboarding Page
  static const subtitleText = TextStyle(
    fontSize: 16,
    fontFamily: FontFamily.inter,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );

  static const skipText = TextStyle(
    fontSize: 16,
    fontFamily: FontFamily.inter,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  // Sign In
  static const appBarTitle = TextStyle(
    fontSize: 16,
    fontFamily: FontFamily.inter,
    color: ColorFamily.blackPrimary,
    fontWeight: FontWeight.w500,
  );

  static const signInHeadline = TextStyle(
    fontSize: 24,
    fontFamily: FontFamily.montserrat,
    color: ColorFamily.blackPrimary,
    fontWeight: FontWeight.w700,
  );

  static const signInHaventAccount = TextStyle(
    fontSize: 12,
    fontFamily: FontFamily.inter,
    color: ColorFamily.greyPrimary,
  );

  static const signInToRegister = TextStyle(
    color: ColorFamily.tealPrimary,
    fontWeight: FontWeight.w500,
  );
}
