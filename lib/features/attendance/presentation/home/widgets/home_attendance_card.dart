import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/components/dt_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum HomeAttendanceCardType {
  checkIn,
  checkOut,
  finished,
}

class HomeAttendanceCard extends StatelessWidget {
  const HomeAttendanceCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    required this.actionText,
    required this.type,
  }) : super(key: key);

  final HomeAttendanceCardType type;
  final String title;
  final String subtitle;
  final String actionText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final bodyStyle = Theme.of(context).textTheme.caption!.copyWith(
          color: ColorFamily.blackPrimary,
          fontWeight: FontWeight.w500,
        );

    return Container(
      decoration: const BoxDecoration(
        color: ColorFamily.tealThird,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          (type == HomeAttendanceCardType.checkOut)
              ? Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: CalculateSize.getWidth(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kondisi',
                              style: bodyStyle.copyWith(
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              '🏢 Rumah',
                              style: bodyStyle,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lokasi',
                              style: bodyStyle.copyWith(
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              '🤧 Kurang fit',
                              style: bodyStyle,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: DTElevatedButton(
                          onPressed: () {},
                          text: 'Perbaharui',
                          fontSize: 12,
                          type: DTElevatedButtonType.primary,
                        ),
                      )
                    ],
                  ),
                )
              : const SizedBox.shrink(),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: CalculateSize.getWidth(18),
                vertical: CalculateSize.getHeight(17),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontWeight: FontWeight.w700,
                              color: ColorFamily.blackPrimary,
                            ),
                      ),
                      StreamBuilder(
                        stream: Stream.periodic(const Duration(seconds: 1)),
                        builder: (context, snapshot) {
                          return Text(
                            DateFormat('EEEE, dd MMMM yyyy HH:mm:ss').format(
                              DateTime.now(),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: bodyStyle,
                          );
                        },
                      ),
                      Text(
                        'Lihat Info Presensi',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorFamily.tealPrimary,
                            ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: onPressed,
                    icon: const Icon(
                      Icons.login,
                      color: ColorFamily.tealPrimary,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
