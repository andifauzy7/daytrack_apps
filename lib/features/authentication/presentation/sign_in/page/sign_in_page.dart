import 'package:daytrack_apps/features/authentication/presentation/widgets/authentication_text_theme.dart';
import 'package:daytrack_apps/features/main/presentation/main/page/main_page.dart';
import 'package:daytrack_apps/gen/assets.gen.dart';
import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/components/dt_elevated_button.dart';
import 'package:daytrack_apps/shared/components/dt_text_field.dart';
import 'package:daytrack_apps/shared/string_value.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        foregroundColor: ColorFamily.blackPrimary,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          StringValue.signIn,
          style: AuthenticationTextTheme.appBarTitle,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: CalculateSize.getWidth(45),
                ),
                child: Image.asset(
                  Assets.images.signInIllustration.path,
                  width: double.infinity,
                  height: CalculateSize.getHeight(240),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: CalculateSize.getWidth(28),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      StringValue.signInWelcome,
                      style: AuthenticationTextTheme.signInHeadline,
                    ),
                    SizedBox(
                      height: CalculateSize.getHeight(10),
                    ),
                    const DTTextField(
                      type: DTTextFieldType.text,
                      hintText: StringValue.signInHintEmail,
                    ),
                    const DTTextField(
                      type: DTTextFieldType.password,
                      hintText: StringValue.signInHintPassword,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(
                        vertical: CalculateSize.getHeight(12),
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: '${StringValue.signInHaventAccount} ',
                          style: AuthenticationTextTheme.signInHaventAccount,
                          children: <TextSpan>[
                            TextSpan(
                              text: StringValue.signInCallHumanResource,
                              style: AuthenticationTextTheme.signInToRegister,
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    DTElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const MainPage(),
                            ),
                          );
                        },
                        text: StringValue.signInEntry,
                        type: DTElevatedButtonType.primary),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
