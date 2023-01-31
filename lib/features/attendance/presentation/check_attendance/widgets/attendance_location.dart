import 'package:daytrack_apps/gen/assets.gen.dart';
import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/components/dt_elevated_button.dart';
import 'package:flutter/material.dart';

class AttendanceLocation extends StatelessWidget {
  const AttendanceLocation({
    Key? key,
    required this.onNext,
    required this.onPrevious,
  }) : super(key: key);

  final VoidCallback onNext;
  final VoidCallback onPrevious;

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
                                  const Text('Kantor'),
                                  const Spacer(),
                                  const Text('🏢')
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
                                  const Text('Rumah'),
                                  const Spacer(),
                                  const Text('🏡')
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
                                  const Text('Lainnya'),
                                  const Spacer(),
                                  const Text('📍')
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
                              text: 'Selanjutnya',
                              type: DTElevatedButtonType.primary,
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
