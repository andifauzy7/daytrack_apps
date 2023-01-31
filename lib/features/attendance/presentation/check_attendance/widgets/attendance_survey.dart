import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/components/dt_elevated_button.dart';
import 'package:flutter/material.dart';

class AttendanceSurvey extends StatelessWidget {
  const AttendanceSurvey({
    Key? key,
    required this.onNext,
    required this.onPrevious,
  }) : super(key: key);

  final VoidCallback onNext;
  final VoidCallback onPrevious;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(
              CalculateSize.getWidth(16),
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Pertanyaan Survey',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ColorFamily.blackPrimary,
                    ),
              ),
              Text(
                'Apa buah kesukaanmu?',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: ColorFamily.blackPrimary,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(
                height: CalculateSize.getHeight(16),
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: CalculateSize.getHeight(6),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: CalculateSize.getHeight(12),
                        horizontal: CalculateSize.getHeight(12),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: ColorFamily.greyPrimary,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.radio_button_off,
                            color: ColorFamily.greyPrimary,
                          ),
                          SizedBox(
                            width: CalculateSize.getWidth(8),
                          ),
                          const Text('Apel'),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: CalculateSize.getHeight(6),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: CalculateSize.getHeight(12),
                        horizontal: CalculateSize.getHeight(12),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: ColorFamily.greyPrimary,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.radio_button_off,
                            color: ColorFamily.greyPrimary,
                          ),
                          SizedBox(
                            width: CalculateSize.getWidth(8),
                          ),
                          const Text('Jeruk'),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: CalculateSize.getHeight(6),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: CalculateSize.getHeight(12),
                        horizontal: CalculateSize.getHeight(12),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: ColorFamily.greyPrimary,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.radio_button_off,
                            color: ColorFamily.greyPrimary,
                          ),
                          SizedBox(
                            width: CalculateSize.getWidth(8),
                          ),
                          const Text('Melon'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: DTElevatedButton(
                      onPressed: onPrevious,
                      text: 'Sebelumnya',
                      type: DTElevatedButtonType.secondary,
                    ),
                  ),
                  SizedBox(
                    width: CalculateSize.getWidth(8),
                  ),
                  Expanded(
                    child: DTElevatedButton(
                      onPressed: onNext,
                      text: 'Selesai',
                      type: DTElevatedButtonType.primary,
                    ),
                  )
                ],
              )
            ]),
          ),
        )
      ],
    );
  }
}
