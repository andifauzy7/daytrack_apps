import 'package:daytrack_apps/shared/string_value.dart';
import 'package:flutter/material.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({
    Key? key,
    required this.showPreviousButton,
    required this.showSkipText,
    required this.onPrevious,
    required this.onSkip,
  }) : super(key: key);

  final bool showPreviousButton;
  final bool showSkipText;
  final VoidCallback onPrevious;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: showPreviousButton,
          child: InkWell(
            onTap: onPrevious,
            child: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        showSkipText
            ? const SizedBox.shrink()
            : InkWell(
                onTap: onSkip,
                child: Text(
                  StringValue.onboardSkip,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Theme.of(context).canvasColor,
                      ),
                ),
              )
      ],
    );
  }
}
