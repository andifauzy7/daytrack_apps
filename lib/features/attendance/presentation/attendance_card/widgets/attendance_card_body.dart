import 'package:daytrack_apps/features/attendance/domain/entities/attendance_record.dart';
import 'package:daytrack_apps/features/attendance/presentation/attendance_card/bloc/attendance_card_bloc.dart';
import 'package:daytrack_apps/features/attendance/presentation/attendance_card/enum/home_attendance_card_type.dart';
import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/constants_value.dart';
import 'package:daytrack_apps/shared/string_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class AttendanceCardBody extends StatefulWidget {
  const AttendanceCardBody({
    Key? key,
  }) : super(key: key);

  @override
  State<AttendanceCardBody> createState() => _AttendanceCardBodyState();
}

class _AttendanceCardBodyState extends State<AttendanceCardBody> {
  void navigateToCheckAttendance(AttendanceRecord? attendanceRecord) =>
      Navigator.pushNamed(context, ConstantsValue.attendanceRoute,
          arguments: attendanceRecord);

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AttendanceCardBloc>(context).add(
      AttendanceCardFetchData(),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          BlocBuilder<AttendanceCardBloc, AttendanceCardState>(
            builder: (context, state) {
              if (state is AttendanceCardLoaded &&
                  state.type == HomeAttendanceCardType.checkOut) {
                return UpdateAttendance(
                  attendanceRecord: state.attendanceRecord,
                  onUpdate: () =>
                      navigateToCheckAttendance(state.attendanceRecord),
                );
              }
              return const SizedBox.shrink();
            },
          ),
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
              child: BlocBuilder<AttendanceCardBloc, AttendanceCardState>(
                builder: (context, state) {
                  if (state is AttendanceCardLoaded) {
                    return Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              state.type.textTitle(context),
                              state.type.textSubtitle(
                                  context,
                                  (state.type ==
                                          HomeAttendanceCardType.checkOut)
                                      ? state.attendanceRecord?.checkIn
                                      : state.attendanceRecord?.checkOut),
                              Text(
                                StringValue.infoAttendance,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: ColorFamily.tealPrimary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        state.type.icon(
                          () =>
                              navigateToCheckAttendance(state.attendanceRecord),
                        )
                      ],
                    );
                  }
                  return const AttendanceCardCircularLoading();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
