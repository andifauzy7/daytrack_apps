import 'package:daytrack_apps/gen/assets.gen.dart';
import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/constants_value.dart';
import 'package:daytrack_apps/shared/string_value.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum HomeAttendanceCardType {
  checkIn,
  checkOut,
  finished,
}

extension HomeAttendanceCardTypeExtension on HomeAttendanceCardType {
  Widget textTitle(BuildContext context) {
    TextStyle textTitleStyle = Theme.of(context).textTheme.subtitle2!.copyWith(
          fontWeight: FontWeight.w700,
        );

    switch (this) {
      case HomeAttendanceCardType.checkIn:
        return Text(
          'Saatnya Check-In',
          style: textTitleStyle.copyWith(
            color: ColorFamily.blackPrimary,
          ),
        );
      case HomeAttendanceCardType.checkOut:
        return Text(
          'Selamat Bekerja',
          style: textTitleStyle.copyWith(
            color: ColorFamily.redPrimary,
          ),
        );
      case HomeAttendanceCardType.finished:
        return Text(
          'Selamat Beristirahat',
          style: textTitleStyle.copyWith(
            fontWeight: FontWeight.w500,
            color: ColorFamily.blackPrimary,
          ),
        );
    }
  }

  Widget textSubtitle(BuildContext context, DateTime? clock) {
    TextStyle textSubtitleStyle = Theme.of(context).textTheme.caption!.copyWith(
          color: ColorFamily.blackPrimary,
          fontWeight: FontWeight.w500,
        );
    switch (this) {
      case HomeAttendanceCardType.checkIn:
        return StreamBuilder(
          stream: Stream.periodic(const Duration(seconds: 1)),
          builder: (context, snapshot) {
            return Text(
              DateFormat(ConstantsValue.dateTimeSentences).format(
                DateTime.now(),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textSubtitleStyle,
            );
          },
        );
      case HomeAttendanceCardType.checkOut:
        return Text(
          StringValue.hasBeenCheckIn +
              ((clock != null)
                  ? DateFormat(ConstantsValue.time).format(clock)
                  : ''),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: textSubtitleStyle,
        );
      case HomeAttendanceCardType.finished:
        return Text(
          StringValue.hasBeenCheckOut +
              ((clock != null)
                  ? DateFormat(ConstantsValue.time).format(clock)
                  : ''),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textSubtitleStyle,
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
