import 'package:daytrack_apps/features/attendance/domain/entities/attendance_record.dart';
import 'package:daytrack_apps/features/attendance/presentation/check_attendance/enum/check_attendance_step.dart';
import 'package:daytrack_apps/features/authentication/domain/entities/user.dart';
import 'package:daytrack_apps/gen/assets.gen.dart';
import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/components/dt_elevated_button.dart';
import 'package:daytrack_apps/shared/string_value.dart';
import 'package:flutter/material.dart';

class AttendanceFinished extends StatelessWidget {
  const AttendanceFinished({
    Key? key,
    required this.onFinished,
    required this.attendanceRecord,
    required this.type,
    required this.user,
  }) : super(key: key);

  final VoidCallback onFinished;
  final AttendanceRecord attendanceRecord;
  final CheckAttendanceType type;
  final User user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(
                CalculateSize.getWidth(16),
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: CalculateSize.getWidth(45),
                      ),
                      child: Image.asset(
                        Assets.images.greeting.path,
                        width: double.infinity,
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      user.name,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: ColorFamily.tealPrimary,
                          ),
                    ),
                    Text(
                      (type == CheckAttendanceType.checkOut)
                          ? StringValue.goodRest
                          : StringValue.goodWork,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: ColorFamily.blackPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    SizedBox(
                      height: CalculateSize.getHeight(16),
                    ),
                    Text(
                      attendanceRecord.getCondition(),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: ColorFamily.blackPrimary,
                          ),
                    ),
                    Text(
                      attendanceRecord.getLocation(),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: ColorFamily.blackPrimary,
                          ),
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                    DTElevatedButton(
                      onPressed: onFinished,
                      text: StringValue.finish,
                      type: DTElevatedButtonType.primary,
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
