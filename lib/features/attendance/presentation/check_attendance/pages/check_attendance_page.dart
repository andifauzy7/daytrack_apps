import 'package:daytrack_apps/core/service_locator/service_locator.dart';
import 'package:daytrack_apps/features/attendance/domain/entities/attendance_record.dart';
import 'package:daytrack_apps/features/attendance/presentation/check_attendance/bloc/check_attendance_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class CheckAttendancePage extends StatelessWidget {
  const CheckAttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    AttendanceRecord? record =
        ModalRoute.of(context)?.settings.arguments as AttendanceRecord?;

    print(record.toString());

    return BlocProvider(
      create: (_) => sl.get<CheckAttendanceBloc>(),
      child: const CheckAttendanceBody(),
    );
  }

/*
  Future<void> _showMyDialog() async {
    TextStyle bodyStyle = Theme.of(context).textTheme.caption!.copyWith(
          color: ColorFamily.blackPrimary,
          fontWeight: FontWeight.w500,
        );

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Apakah kamu yakin?',
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ColorFamily.blackPrimary,
                ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Kamu akan melakukan check-in, silahkan cek lagi pilihanmu.',
                  style: bodyStyle,
                ),
                SizedBox(
                  height: CalculateSize.getHeight(32),
                ),
                Text(
                  'Check-In Pukul 21:15 WIB',
                  style: bodyStyle,
                ),
                Text(
                  'Kurang Fit',
                  style: bodyStyle,
                ),
                SizedBox(
                  height: CalculateSize.getHeight(8),
                ),
                Text(
                  'Rumah',
                  style: bodyStyle,
                ),
                Text(
                  'Jln. Dago Asri, West Java, Indonesia',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: bodyStyle.copyWith(
                    color: ColorFamily.tealPrimary,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: DTElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    text: 'Kembali',
                    type: DTElevatedButtonType.secondary,
                  ),
                ),
                SizedBox(
                  width: CalculateSize.getWidth(8),
                ),
                Expanded(
                  child: DTElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: 'Check-In',
                    type: DTElevatedButtonType.primary,
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
  */
}
