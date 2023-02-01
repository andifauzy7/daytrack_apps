import 'package:daytrack_apps/gen/assets.gen.dart';
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

extension HomeAttendanceCardTypeExtension on HomeAttendanceCardType {
  Widget textTitle(BuildContext context) {
    switch (this) {
      case HomeAttendanceCardType.checkIn:
        return Text(
          'Saatnya Check-In',
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontWeight: FontWeight.w700,
                color: ColorFamily.blackPrimary,
              ),
        );
      case HomeAttendanceCardType.checkOut:
        return Text(
          'Selamat Bekerja',
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontWeight: FontWeight.w700,
                color: ColorFamily.redPrimary,
              ),
        );
      case HomeAttendanceCardType.finished:
        return Text(
          'Selamat Beristirahat',
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontWeight: FontWeight.w500,
                color: ColorFamily.blackPrimary,
              ),
        );
    }
  }

  Widget textSubtitle(BuildContext context) {
    switch (this) {
      case HomeAttendanceCardType.checkIn:
        return StreamBuilder(
          stream: Stream.periodic(const Duration(seconds: 1)),
          builder: (context, snapshot) {
            return Text(
              DateFormat('EEEE, dd MMMM yyyy HH:mm:ss').format(
                DateTime.now(),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: ColorFamily.blackPrimary,
                    fontWeight: FontWeight.w500,
                  ),
            );
          },
        );
      case HomeAttendanceCardType.checkOut:
        return Text(
          'Sudah Check-In pukul 21.15 WIB',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: ColorFamily.blackPrimary,
                fontWeight: FontWeight.w500,
              ),
        );
      case HomeAttendanceCardType.finished:
        return Text(
          'Sudah Check-Out pukul 21.15 WIB',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: ColorFamily.blackPrimary,
                fontWeight: FontWeight.w500,
              ),
        );
    }
  }

  Widget icon(VoidCallback onPressed) {
    switch (this) {
      case HomeAttendanceCardType.checkIn:
        return IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.login,
            color: ColorFamily.tealPrimary,
          ),
        );
      case HomeAttendanceCardType.checkOut:
        return IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.logout,
            color: ColorFamily.redPrimary,
          ),
        );
      case HomeAttendanceCardType.finished:
        return Image.asset(
          Assets.images.greeting.path,
          width: CalculateSize.getWidth(64),
          height: CalculateSize.getWidth(64),
        );
    }
  }
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
              ? UpdateAttendance(bodyStyle: bodyStyle)
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
                      type.textTitle(context),
                      type.textSubtitle(context),
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
                  type.icon(onPressed)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UpdateAttendance extends StatelessWidget {
  const UpdateAttendance({
    Key? key,
    required this.bodyStyle,
  }) : super(key: key);

  final TextStyle bodyStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
