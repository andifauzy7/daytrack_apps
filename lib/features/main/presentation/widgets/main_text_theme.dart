import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class MainTextTheme {
  MainTextTheme._();

  // Assignment Page
  static const assignmentTitleText = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: ColorFamily.blackPrimary,
  );

  static const assignmentSubtitleText = TextStyle(
    fontFamily: FontFamily.inter,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: ColorFamily.greyPrimary,
  );

  // Home Page
  static const homeTitleAppBar = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Colors.white,
  );

  static const homeTitleCard = TextStyle(
    fontFamily: FontFamily.inter,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: ColorFamily.blackPrimary,
  );

  static const homeSubtitleCard = TextStyle(
    fontFamily: FontFamily.inter,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: ColorFamily.blackPrimary,
  );

  static const homeSubtitleColoredCard = TextStyle(
    fontFamily: FontFamily.inter,
    fontWeight: FontWeight.w600,
    fontSize: 12,
    color: ColorFamily.tealPrimary,
  );

  static const homeHeadingLight = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: Colors.white,
  );

  static const homeHeadingDark = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: ColorFamily.blackPrimary,
  );

  static const homeLeaderboardCardTitle = TextStyle(
    fontFamily: FontFamily.inter,
    fontWeight: FontWeight.w600,
    fontSize: 15,
    color: ColorFamily.blackPrimary,
  );

  static const homeLeaderboardCardSubtitle = TextStyle(
    fontFamily: FontFamily.inter,
    fontWeight: FontWeight.w500,
    fontSize: 13,
    color: ColorFamily.greyPrimary,
  );

  // Profile Page
  static const profileAppBarTitle = TextStyle(
    fontFamily: FontFamily.inter,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: ColorFamily.blackPrimary,
  );

  static const profileName = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: ColorFamily.blackPrimary,
  );

  static const profileHeadTable = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: ColorFamily.greyPrimary,
  );

  static const profileDataTable = TextStyle(
    fontFamily: FontFamily.inter,
    fontWeight: FontWeight.w900,
    fontSize: 18,
    color: ColorFamily.blackPrimary,
  );

  static const profileStudyData = TextStyle(
    fontFamily: FontFamily.inter,
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: ColorFamily.blackPrimary,
  );

  static const profileGradeTitle = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: ColorFamily.blackPrimary,
  );
}
