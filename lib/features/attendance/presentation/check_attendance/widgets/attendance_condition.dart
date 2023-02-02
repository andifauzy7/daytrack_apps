import 'package:daytrack_apps/features/attendance/domain/entities/question.dart';
import 'package:daytrack_apps/features/authentication/domain/entities/user.dart';
import 'package:daytrack_apps/gen/assets.gen.dart';
import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/components/dt_elevated_button.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class AttendanceCondition extends StatefulWidget {
  const AttendanceCondition({
    Key? key,
    required this.onNext,
    required this.question,
    required this.user,
    this.initial,
  }) : super(key: key);

  final int? initial;
  final Function(int) onNext;
  final Question question;
  final User user;

  @override
  State<AttendanceCondition> createState() => _AttendanceConditionState();
}

class _AttendanceConditionState extends State<AttendanceCondition> {
  int? selected;
  String? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Image.asset(
            image ?? Assets.images.onboardingFirst.path,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 3,
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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.user.name,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorFamily.blackPrimary,
                            ),
                      ),
                      Text(
                        widget.question.question,
                        maxLines: 1,
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
                            selected: (selected ?? widget.initial) == index,
                            title: widget.question.option[index].body,
                            emoji: widget.question.option[index].emoji,
                            onTap: () => setState(() {
                              selected = index;
                              image = widget.question.option[index].image;
                            }),
                          ),
                        ),
                      ),
                      DTElevatedButton(
                        onPressed: () => {
                          if (selected != null)
                            {widget.onNext(selected!)}
                          else if (widget.initial != null)
                            {widget.onNext(widget.initial!)}
                        },
                        text: 'Selanjutnya',
                        type: (selected ?? widget.initial) != null
                            ? DTElevatedButtonType.primary
                            : DTElevatedButtonType.disabled,
                      ),
                    ]),
              ),
            )
          ],
        )
      ],
    );
  }
}
