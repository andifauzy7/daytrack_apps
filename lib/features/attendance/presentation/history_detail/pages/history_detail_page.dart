import 'package:daytrack_apps/features/attendance/domain/entities/attendance_record.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/constants_value.dart';
import 'package:daytrack_apps/shared/string_value.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryDetailPage extends StatelessWidget {
  const HistoryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    AttendanceRecord record =
        ModalRoute.of(context)?.settings.arguments as AttendanceRecord;

    return Scaffold(
      appBar: AppBar(
        title: const Text(StringValue.detail),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          CalculateSize.getWidth(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HistoryInformation(
              data: DateFormat(ConstantsValue.dateTimeSentences).format(
                record.checkIn!,
              ),
              title: StringValue.checkIn,
            ),
            HistoryInformation(
              data: record.checkOut != null
                  ? DateFormat(ConstantsValue.dateTimeSentences).format(
                      record.checkOut!,
                    )
                  : '-',
              title: StringValue.checkOut,
            ),
            HistoryInformation(
              data: record.getCondition(),
              title: StringValue.condition,
            ),
            HistoryInformation(
              data: record.getLocation(),
              title: StringValue.location,
            ),
            HistoryInformation(
              data:
                  '${record.detailAddress ?? ''} (Lat. ${record.latitude} Long. ${record.langitude})',
              title: StringValue.locationDetail,
            ),
            HistoryInformation(
              data: record.getSurvey(),
              title: StringValue.survey,
            ),
            HistoryInformation(
              data: record.getWorkingHours(),
              title: StringValue.workingHours,
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryInformation extends StatelessWidget {
  const HistoryInformation({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: CalculateSize.getHeight(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
          ),
          Text(
            data,
          ),
        ],
      ),
    );
  }
}
