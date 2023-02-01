import 'package:daytrack_apps/gen/assets.gen.dart';
import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/components/dt_elevated_button.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class AttendanceLocation extends StatefulWidget {
  const AttendanceLocation({
    Key? key,
    required this.onNext,
    required this.onPrevious,
  }) : super(key: key);

  final Function(int) onNext;
  final VoidCallback onPrevious;

  @override
  State<AttendanceLocation> createState() => _AttendanceLocationState();
}

class _AttendanceLocationState extends State<AttendanceLocation> {
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dimana lokasimu saat ini?',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: ColorFamily.blackPrimary,
                                    ),
                              ),
                              Text(
                                'Jl. Dago Asri I No. 23B, West Java, Indonesia',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: ColorFamily.blackPrimary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.refresh,
                            color: ColorFamily.tealPrimary,
                          )
                        ],
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
                              title: 'Kantor',
                              emoji: '🏢',
                              onTap: () => setState(() {
                                index = 0;
                              }),
                            ),
                            OptionTile(
                              selected: index == 1,
                              title: 'Rumah',
                              emoji: '🏡',
                              onTap: () => setState(() {
                                index = 1;
                              }),
                            ),
                            OptionTile(
                              selected: index == 2,
                              title: 'Lainnya',
                              emoji: '📍',
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
                              text: 'Selanjutnya',
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
        )
      ],
    );
  }
}
