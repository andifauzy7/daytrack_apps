import 'dart:convert';

import 'package:daytrack_apps/core/error/exception.dart';
import 'package:daytrack_apps/features/attendance/data/models/attendance_record_model.dart';
import 'package:daytrack_apps/features/attendance/data/models/option_answer_model.dart';
import 'package:daytrack_apps/features/attendance/data/models/question_model.dart';
import 'package:daytrack_apps/gen/assets.gen.dart';
import 'package:daytrack_apps/shared/constants_value.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const CACHED_ATTENDANCE_RECORD = 'CACHED_ATTENDANCE_RECORD';

abstract class AttendanceLocalDataSource {
  Future<List<QuestionModel>> getQuestions();
  Future<bool> cacheAttendanceRecord(
      AttendanceRecordModel attendanceRecordModel);
  Future<bool> updateAttendanceRecord(
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
            image: Assets.images.healthy.path,
          ),
          OptionAnswerModel(
            body: 'Kurang Fit',
            emoji: '🤧',
            image: Assets.images.healthNotFit.path,
          ),
          OptionAnswerModel(
            body: 'Sakit',
            emoji: '😷',
            image: Assets.images.sick.path,
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
      QuestionModel(
        title: 'Jam Kerja',
        question: 'Pilihan jam kerja kamu?',
        option: [
          OptionAnswerModel(
            body: '08.00 - 16.00',
          ),
          OptionAnswerModel(
            body: '07.00 - 15.00',
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

  @override
  Future<bool> updateAttendanceRecord(
      AttendanceRecordModel attendanceRecordModel) {
    final dateTimeString = DateFormat(ConstantsValue.date).format(
      attendanceRecordModel.dateTime!,
    );
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

    int index = attendances.indexWhere(
        (element) => element.dateTime == attendanceRecordModel.dateTime);
    attendances[index] = attendanceRecordModel;
    final attendanceRecord = sharedPreferences.setString(
      CACHED_ATTENDANCE_RECORD,
      jsonEncode(
        attendances,
      ),
    );
    return Future.value(attendanceRecord);
  }
}
