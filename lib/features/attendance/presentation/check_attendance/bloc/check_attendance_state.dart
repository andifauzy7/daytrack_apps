part of 'check_attendance_bloc.dart';

abstract class CheckAttendanceState extends Equatable {
  const CheckAttendanceState();
  
  @override
  List<Object> get props => [];
}

class CheckAttendanceInitial extends CheckAttendanceState {}
