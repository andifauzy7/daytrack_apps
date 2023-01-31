import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:flutter/material.dart';

class OnboardingFooter extends StatelessWidget {
  const OnboardingFooter({
    Key? key,
    required this.current,
    required this.length,
    required this.onNext,
  }) : super(key: key);

  final int current;
  final int length;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(children: [
          for (int i = 0; i < length; i++)
            AnimatedContainer(
              width: current == i
                  ? CalculateSize.getWidth(50)
                  : CalculateSize.getWidth(30),
              margin: EdgeInsets.only(
                right: CalculateSize.getWidth(5),
              ),
              height: CalculateSize.getHeight(8),
              decoration: BoxDecoration(
                color: current == i
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).canvasColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              duration: const Duration(milliseconds: 300),
            )
        ]),
        const Spacer(
          flex: 1,
        ),
        InkWell(
          onTap: onNext,
          child: Container(
            width: CalculateSize.getWidth(40),
            height: CalculateSize.getWidth(40),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Icon(
              Icons.arrow_forward,
              color: Theme.of(context).canvasColor,
            ),
          ),
        ),
      ],
    );
  }
}
