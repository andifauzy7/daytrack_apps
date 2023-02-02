part of 'check_attendance_bloc.dart';

abstract class CheckAttendanceEvent extends Equatable {
  const CheckAttendanceEvent();

  @override
  List<Object> get props => [];
}

class CheckAttendanceFetchData extends CheckAttendanceEvent {
  final CheckAttendanceArgs args;

  const CheckAttendanceFetchData({required this.args});
}

class CheckAttendanceNextStep extends CheckAttendanceEvent {
  final int answer;

  const CheckAttendanceNextStep({required this.answer});
}

class CheckAttendancePreviousStep extends CheckAttendanceEvent {}

class CheckAttendanceSubmit extends CheckAttendanceEvent {}

class CheckAttendanceRefreshPosition extends CheckAttendanceEvent {}
