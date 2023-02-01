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
  }) : super(key: key);

  final Function(int) onNext;

  @override
  State<AttendanceCondition> createState() => _AttendanceConditionState();
}

class _AttendanceConditionState extends State<AttendanceCondition> {
  int? index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Image.asset(
            Assets.images.onboardingFirst.path,
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
                        'Andi Fauzy',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorFamily.blackPrimary,
                            ),
                      ),
                      Text(
                        'Apa kondisimu hari ini?',
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
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            OptionTile(
                              selected: index == 0,
                              title: 'Sehat',
                              emoji: '😇',
                              onTap: () => setState(() {
                                index = 0;
                              }),
                            ),
                            OptionTile(
                              selected: index == 1,
                              title: 'Kurang Fit',
                              emoji: '🤧',
                              onTap: () => setState(() {
                                index = 1;
                              }),
                            ),
                            OptionTile(
                              selected: index == 2,
                              title: 'Sakit',
                              emoji: '😷',
                              onTap: () => setState(() {
                                index = 2;
                              }),
                            ),
                          ],
                        ),
                      ),
                      DTElevatedButton(
                        onPressed: () => widget.onNext(index!),
                        text: 'Selanjutnya',
                        type: index != null
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
