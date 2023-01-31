import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/string_value.dart';
import 'package:flutter/material.dart';

class SignInHeader extends StatelessWidget implements PreferredSizeWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.white,
      foregroundColor: ColorFamily.blackPrimary,
      elevation: 0,
      centerTitle: true,
      title: Text(
        StringValue.signIn,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.w500,
              color: ColorFamily.blackPrimary,
            ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
