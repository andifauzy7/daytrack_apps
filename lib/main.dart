import 'package:daytrack_apps/core/injection/injection.dart';
import 'package:daytrack_apps/features/authentication/presentation/splash/page/splash_page.dart';
import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/color_to_material_color.dart';
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
        ),
        home: const SplashPage(),
      ),
    );
  }
}
