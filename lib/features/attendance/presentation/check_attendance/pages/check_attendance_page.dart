import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/components/dt_elevated_button.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CheckAttendancePage extends StatefulWidget {
  const CheckAttendancePage({super.key});

  @override
  State<CheckAttendancePage> createState() => _CheckAttendancePageState();
}

class _CheckAttendancePageState extends State<CheckAttendancePage> {
  int index = 0;

  String getTitle() {
    if (index == 0) {
      return 'Kondisi';
    }

    if (index == 1) {
      return 'Lokasi';
    }

    if (index == 2) {
      return 'Survey';
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (index == 0) {
          return true;
        } else {
          setState(() {
            index -= 1;
          });
          return false;
        }
      },
      child: Scaffold(
        appBar: index != 3
            ? AppBar(
                title: Text(
                  getTitle(),
                ),
              )
            : null,
        body: IndexedStack(index: index, children: [
          AttendanceCondition(
            onNext: () => setState(() {
              index += 1;
            }),
          ),
          AttendanceLocation(
            onNext: () => setState(() {
              index += 1;
            }),
            onPrevious: () => setState(() {
              index -= 1;
            }),
          ),
          AttendanceSurvey(
            onNext: () => {
              _showMyDialog(),
            },
            onPrevious: () => setState(() {
              index -= 1;
            }),
          ),
          AttendanceFinished(
            onFinished: () => Navigator.pop(context),
          )
        ]),
      ),
    );
  }

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
                      setState(() {
                        index += 1;
                      });
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
}
