import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/gradient_rotate.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: -getGradientRotate(139.3),
          end: getGradientRotate(139.3),
          colors: const [
            Colors.teal,
            ColorFamily.tealPrimary,
          ],
          stops: const [-0.09, 1.07],
        ),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
      ),
      child: child,
    );
  }
}
