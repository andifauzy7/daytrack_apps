import 'package:daytrack_apps/features/attendance/domain/entities/attendance_record.dart';
import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/constants_value.dart';
import 'package:daytrack_apps/shared/string_value.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryAttendanceCard extends StatelessWidget {
  const HistoryAttendanceCard({
    Key? key,
    required this.attendanceRecord,
    required this.onTap,
  }) : super(key: key);

  final AttendanceRecord attendanceRecord;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
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
                    '${StringValue.checkInFrom} ${attendanceRecord.getLocation()}',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: ColorFamily.blackPrimary,
                        ),
                  ),
                  Text(
                    DateFormat(ConstantsValue.dateSentences).format(
                      attendanceRecord.checkIn!,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: ColorFamily.blackPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    StringValue.infoAttendance,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: ColorFamily.tealPrimary,
                        ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                attendanceRecord.getConditionEmoji(),
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
