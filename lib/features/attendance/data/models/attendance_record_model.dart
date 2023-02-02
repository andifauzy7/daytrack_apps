import 'package:daytrack_apps/features/attendance/data/models/question_model.dart';
import 'package:daytrack_apps/shared/constants_value.dart';
import 'package:intl/intl.dart';

class AttendanceRecordModel {
  DateTime? dateTime;
  QuestionModel? condition;
  QuestionModel? location;
  double? latitude;
  double? langitude;
  String? detailAddress;
  QuestionModel? survey;
  DateTime? checkIn;
  DateTime? checkOut;
  QuestionModel? workingHours;

  AttendanceRecordModel({
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

  final DateFormat _formatter = DateFormat(ConstantsValue.date);
  final DateFormat _formatterTimestamp = DateFormat(ConstantsValue.dateTime);

  AttendanceRecordModel.fromJson(Map<String, dynamic> json) {
    dateTime = _formatter.parse(json['dateTime']);
    condition = QuestionModel.fromJson(json['condition']);
    location = QuestionModel.fromJson(json['location']);
    latitude = json['latitude'];
    langitude = json['langitude'];
    detailAddress = json['detailAddress'];
    survey = QuestionModel.fromJson(json['survey']);
    checkIn = (json['checkIn'] != null)
        ? _formatterTimestamp.parse(json['checkIn'])
        : null;
    checkOut = (json['checkOut'] != null)
        ? _formatterTimestamp.parse(json['checkOut'])
        : null;
    workingHours = (json['workingHours'] != null)
        ? QuestionModel.fromJson(json['workingHours'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dateTime'] = _formatter.format(dateTime!);
    data['condition'] = condition?.toJson();
    data['location'] = location?.toJson();
    data['latitude'] = latitude;
    data['langitude'] = langitude;
    data['detailAddress'] = detailAddress;
    data['survey'] = survey?.toJson();
    data['checkIn'] =
        (checkIn != null) ? _formatterTimestamp.format(checkIn!) : null;
    data['checkOut'] =
        (checkOut != null) ? _formatterTimestamp.format(checkOut!) : null;
    data['workingHours'] = workingHours?.toJson();
    return data;
  }
}
