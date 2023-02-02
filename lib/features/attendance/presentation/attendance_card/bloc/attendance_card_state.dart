part of 'attendance_card_bloc.dart';

abstract class AttendanceCardState extends Equatable {
  const AttendanceCardState();

  @override
  List<Object> get props => [];
}

class AttendanceCardInitial extends AttendanceCardState {}

class AttendanceCardLoading extends AttendanceCardState {}

class AttendanceCardError extends AttendanceCardState {
  final String errorMessage;

  const AttendanceCardError({required this.errorMessage});
}

class AttendanceCardLoaded extends AttendanceCardState {
  final HomeAttendanceCardType type;
  final AttendanceRecord? attendanceRecord;

  const AttendanceCardLoaded({
    this.attendanceRecord,
    required this.type,
  });
}
