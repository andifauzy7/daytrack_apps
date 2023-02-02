import 'package:daytrack_apps/features/attendance/domain/entities/attendance_record.dart';
import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/components/dt_elevated_button.dart';
import 'package:daytrack_apps/shared/string_value.dart';
import 'package:flutter/material.dart';

class UpdateAttendance extends StatelessWidget {
  const UpdateAttendance({
    Key? key,
    required this.attendanceRecord,
    required this.onUpdate,
  }) : super(key: key);

  final AttendanceRecord? attendanceRecord;
  final VoidCallback onUpdate;

  @override
  Widget build(BuildContext context) {
    final bodyStyle = Theme.of(context).textTheme.caption!.copyWith(
          color: ColorFamily.blackPrimary,
          fontWeight: FontWeight.w500,
        );

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
                  StringValue.condition,
                  style: bodyStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
                Text(
                  attendanceRecord?.getCondition() ?? '',
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
                  StringValue.location,
                  style: bodyStyle.copyWith(
                    fontSize: 10,
                  ),
                ),
                Text(
                  attendanceRecord?.getLocation() ?? '',
                  style: bodyStyle,
                ),
              ],
            ),
          ),
          Expanded(
            child: DTElevatedButton(
              onPressed: onUpdate,
              text: StringValue.update,
              fontSize: 12,
              type: DTElevatedButtonType.primary,
            ),
          )
        ],
      ),
    );
  }
}
