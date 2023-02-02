import 'package:daytrack_apps/features/attendance/domain/entities/question.dart';
import 'package:equatable/equatable.dart';

class AttendanceRecord extends Equatable {
  DateTime? dateTime;
  Question? condition;
  Question? location;
  double? latitude;
  double? langitude;
  String? detailAddress;
  Question? survey;
  DateTime? checkIn;
  DateTime? checkOut;
  Question? workingHours;

  AttendanceRecord({
    this.dateTime,
    this.condition,
    this.location,
    this.latitude,
    this.langitude,
    this.detailAddress,
    this.survey,
    this.checkIn,
    this.checkOut,
    this.workingHours,
  });

  @override
  List<Object?> get props => [
        dateTime,
        condition,
        location,
        latitude,
        langitude,
        detailAddress,
        survey,
        checkIn,
        checkOut,
        workingHours,
      ];

  String getLocation() {
    int answer = location?.answer ?? 0;
    String emoji = location?.option[answer].emoji ?? '';
    String content = location?.option[answer].body ?? '';
    return '$emoji $content';
  }

  String getCondition() {
    int answer = condition?.answer ?? 0;
    String emoji = condition?.option[answer].emoji ?? '';
    String content = condition?.option[answer].body ?? '';
    return '$emoji $content';
  }

  String getConditionEmoji() {
    int answer = condition?.answer ?? 0;
    String emoji = condition?.option[answer].emoji ?? '';
    return emoji;
  }

  String getSurvey() {
    int answer = survey?.answer ?? 0;
    String question = survey?.question ?? '';
    String content = survey?.option[answer].body ?? '';
    return '$question $content';
  }

  String getWorkingHours() {
    int answer = workingHours?.answer ?? 0;
    String content = workingHours?.option[answer].body ?? '-';
    return content;
  }
}
