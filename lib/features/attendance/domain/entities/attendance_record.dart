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
}
