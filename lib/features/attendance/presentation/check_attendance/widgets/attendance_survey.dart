import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/components/dt_elevated_button.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class AttendanceSurvey extends StatefulWidget {
  const AttendanceSurvey({
    Key? key,
    required this.onNext,
    required this.onPrevious,
  }) : super(key: key);

  final Function(int) onNext;
  final VoidCallback onPrevious;

  @override
  State<AttendanceSurvey> createState() => _AttendanceSurveyState();
}

class _AttendanceSurveyState extends State<AttendanceSurvey> {
  int? index;
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
                    OptionTile(
                      selected: index == 0,
                      title: 'Apel',
                      onTap: () => setState(() {
                        index = 0;
                      }),
                    ),
                    OptionTile(
                      selected: index == 1,
                      title: 'Jeruk',
                      onTap: () => setState(() {
                        index = 1;
                      }),
                    ),
                    OptionTile(
                      selected: index == 2,
                      title: 'Melon',
                      onTap: () => setState(() {
                        index = 2;
                      }),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: DTElevatedButton(
                      onPressed: widget.onPrevious,
                      text: 'Sebelumnya',
                      type: DTElevatedButtonType.secondary,
                    ),
                  ),
                  SizedBox(
                    width: CalculateSize.getWidth(8),
                  ),
                  Expanded(
                    child: DTElevatedButton(
                      onPressed: () => widget.onNext(index!),
                      text: 'Selesai',
                      type: index != null
                          ? DTElevatedButtonType.primary
                          : DTElevatedButtonType.disabled,
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
