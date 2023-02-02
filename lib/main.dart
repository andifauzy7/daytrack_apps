import 'package:daytrack_apps/core/injection/injection.dart';
import 'package:daytrack_apps/features/attendance/presentation/check_attendance/pages/check_attendance_page.dart';
import 'package:daytrack_apps/features/attendance/presentation/history_detail/pages/history_detail_page.dart';
import 'package:daytrack_apps/features/authentication/presentation/edit_profile/page/edit_profile.dart';
import 'package:daytrack_apps/features/authentication/presentation/onboarding/page/onboarding_page.dart';
import 'package:daytrack_apps/features/authentication/presentation/sign_in/page/sign_in_page.dart';
import 'package:daytrack_apps/features/authentication/presentation/splash/page/splash_page.dart';
import 'package:daytrack_apps/features/main/presentation/main/page/main_page.dart';
import 'package:daytrack_apps/features/timeline/presentation/announcement/pages/announcement_page.dart';
import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/gen/fonts.gen.dart';
import 'package:daytrack_apps/shared/color_to_material_color.dart';
import 'package:daytrack_apps/shared/constants_value.dart';
import 'package:daytrack_apps/shared/string_value.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Injection().initialize().then(
        (_) => runApp(
          const MyApp(),
        ),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringValue.titleApp,
        theme: ThemeData(
          primarySwatch: getMaterialColor(ColorFamily.tealPrimary),
          canvasColor: ColorFamily.canvasPrimary,
          textTheme: const TextTheme(
            headline4: TextStyle(
              fontSize: 32,
              fontFamily: FontFamily.montserrat,
              fontWeight: FontWeight.w700,
            ),
            headline5: TextStyle(
              fontSize: 24,
              fontFamily: FontFamily.montserrat,
              fontWeight: FontWeight.w700,
            ),
            subtitle1: TextStyle(
              fontSize: 16,
              fontFamily: FontFamily.inter,
              fontWeight: FontWeight.w600,
            ),
            subtitle2: TextStyle(
              fontSize: 14,
              fontFamily: FontFamily.inter,
              fontWeight: FontWeight.w500,
            ),
            caption: TextStyle(
              fontSize: 12,
              fontFamily: FontFamily.inter,
            ),
          ),
        ),
        initialRoute: ConstantsValue.initialRoute,
        routes: {
          ConstantsValue.initialRoute: (context) => const SplashPage(),
          ConstantsValue.onboardingRoute: (context) => const OnboardingPage(),
          ConstantsValue.loginRoute: (context) => const SignInPage(),
          ConstantsValue.mainRoute: (context) => const MainPage(),
          ConstantsValue.editProfileRoute: (context) => const EditProfilePage(),
          ConstantsValue.announcementRoute: (context) =>
              const AnnouncementPage(),
          ConstantsValue.attendanceRoute: (context) =>
              const CheckAttendancePage(),
          ConstantsValue.historyDetailRoute: (context) =>
              const HistoryDetailPage(),
        },
      ),
    );
  }
}
