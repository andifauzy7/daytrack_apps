import 'package:flutter/material.dart';

class OnboardingTextContent extends StatelessWidget {
  const OnboardingTextContent({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Theme.of(context).canvasColor,
              ),
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Theme.of(context).canvasColor,
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
