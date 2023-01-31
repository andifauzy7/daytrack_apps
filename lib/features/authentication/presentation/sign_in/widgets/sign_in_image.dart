import 'package:daytrack_apps/gen/assets.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:flutter/material.dart';

class SignInImage extends StatelessWidget {
  const SignInImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: CalculateSize.getWidth(45),
      ),
      child: Image.asset(
        Assets.images.signInIllustration.path,
        width: double.infinity,
        height: CalculateSize.getHeight(240),
      ),
    );
  }
}
