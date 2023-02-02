import 'dart:convert';

import 'package:daytrack_apps/core/error/exception.dart';
import 'package:daytrack_apps/features/attendance/data/models/attendance_record_model.dart';
import 'package:daytrack_apps/features/attendance/data/models/option_answer_model.dart';
import 'package:daytrack_apps/features/attendance/data/models/question_model.dart';
import 'package:daytrack_apps/gen/assets.gen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const CACHED_ATTENDANCE_RECORD = 'CACHED_ATTENDANCE_RECORD';

abstract class AttendanceLocalDataSource {
  Future<List<QuestionModel>> getQuestions();
  Future<bool> cacheAttendanceRecord(
      AttendanceRecordModel attendanceRecordModel);
  Future<List<AttendanceRecordModel>> getListAttendanceRecord();
  Future<AttendanceRecordModel> getAttendanceRecord(DateTime dateTime);
}

class AttendanceLocalDataSourceImpl implements AttendanceLocalDataSource {
  final SharedPreferences sharedPreferences;

  AttendanceLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<List<QuestionModel>> getQuestions() {
    List<QuestionModel> question = [
      QuestionModel(
        title: 'Kondisi',
        question: 'Apa kondisimu hari ini?',
        option: [
          OptionAnswerModel(
            body: 'Sehat',
            emoji: '😇',
            image: Assets.images.onboardingFirst.path,
          ),
          OptionAnswerModel(
            body: 'Kurang Fit',
            emoji: '🤧',
            image: Assets.images.onboardingSecond.path,
          ),
          OptionAnswerModel(
            body: 'Sakit',
            emoji: '😷',
            image: Assets.images.onboardingThird.path,
          ),
        ],
      ),
      QuestionModel(
        title: 'Lokasi',
        question: 'Dimana lokasimu saat ini?',
        option: [
          OptionAnswerModel(
            body: 'Kantor',
            emoji: '🏢',
          ),
          OptionAnswerModel(
            body: 'Rumah',
            emoji: '🏡',
          ),
          OptionAnswerModel(
            body: 'Lainnya',
            emoji: '📍',
          ),
        ],
      ),
      QuestionModel(
        title: 'Survey',
        question: 'Apa buah kesukaanmu?',
        option: [
          OptionAnswerModel(
            body: 'Apel',
          ),
          OptionAnswerModel(
            body: 'Jeruk',
          ),
          OptionAnswerModel(
            body: 'Melon',
          ),
        ],
      ),
    ];
    return Future.value(question);
  }

  @override
  Future<bool> cacheAttendanceRecord(
      AttendanceRecordModel attendanceRecordModel) {
    List<AttendanceRecordModel> attendances = [];

    final getRecordResult =
        sharedPreferences.getString(CACHED_ATTENDANCE_RECORD);
    if (getRecordResult != null) {
      attendances.addAll(
        (jsonDecode(getRecordResult) as List)
            .map((data) => AttendanceRecordModel.fromJson(data))
            .toList(),
      );
    }
    attendances.add(attendanceRecordModel);

    final attendanceRecord = sharedPreferences.setString(
      CACHED_ATTENDANCE_RECORD,
      jsonEncode(
        attendances,
      ),
    );
    return Future.value(attendanceRecord);
  }

  @override
  Future<List<AttendanceRecordModel>> getListAttendanceRecord() {
    final attendanceRecord =
        sharedPreferences.getString(CACHED_ATTENDANCE_RECORD);
    if (attendanceRecord == null) {
      throw CacheException();
    } else {
      List<AttendanceRecordModel> record =
          (jsonDecode(attendanceRecord) as List)
              .map((data) => AttendanceRecordModel.fromJson(data))
              .toList();
      return Future.value(record);
    }
  }

  @override
  Future<AttendanceRecordModel> getAttendanceRecord(DateTime dateTime) {
    final attendanceRecord =
        sharedPreferences.getString(CACHED_ATTENDANCE_RECORD);
    if (attendanceRecord == null) {
      throw CacheException();
    } else {
      List<AttendanceRecordModel> records =
          (jsonDecode(attendanceRecord) as List)
              .map((data) => AttendanceRecordModel.fromJson(data))
              .toList();

      AttendanceRecordModel record = records.firstWhere(
        (element) => element.dateTime == dateTime,
        orElse: () => AttendanceRecordModel(checkIn: null),
      );

      if (record.checkIn == null) {
        throw CacheException();
      }

      return Future.value(record);
    }
  }
}
