import 'package:daytrack_apps/features/attendance/domain/entities/question.dart';
import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/components/dt_elevated_button.dart';
import 'package:daytrack_apps/shared/string_value.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class AttendanceSurvey extends StatefulWidget {
  const AttendanceSurvey({
    Key? key,
    required this.onNext,
    required this.onPrevious,
    required this.question,
    this.initial,
  }) : super(key: key);

  final int? initial;
  final Function(int) onNext;
  final VoidCallback onPrevious;
  final Question question;

  @override
  State<AttendanceSurvey> createState() => _AttendanceSurveyState();
}

class _AttendanceSurveyState extends State<AttendanceSurvey> {
  int? selected;
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
                widget.question.title,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ColorFamily.blackPrimary,
                    ),
              ),
              Text(
                widget.question.question,
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
                child: ListView.builder(
                  itemCount: widget.question.option.length,
                  itemBuilder: (context, index) => OptionTile(
                    selected: index == (selected ?? widget.initial),
                    title: widget.question.option[index].body,
                    onTap: () => setState(() {
                      selected = index;
                    }),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: DTElevatedButton(
                      onPressed: widget.onPrevious,
                      text: StringValue.previous,
                      type: DTElevatedButtonType.secondary,
                    ),
                  ),
                  SizedBox(
                    width: CalculateSize.getWidth(8),
                  ),
                  Expanded(
                    child: DTElevatedButton(
                      onPressed: () => {
                        if (selected != null)
                          {widget.onNext(selected!)}
                        else if (widget.initial != null)
                          {widget.onNext(widget.initial!)}
                      },
                      text: StringValue.finish,
                      type: (selected ?? widget.initial) != null
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
