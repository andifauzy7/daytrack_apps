part of 'check_attendance_bloc.dart';

abstract class CheckAttendanceEvent extends Equatable {
  const CheckAttendanceEvent();

  @override
  List<Object> get props => [];
}

class CheckAttendanceFetchData extends CheckAttendanceEvent {}

class CheckAttendanceNextStep extends CheckAttendanceEvent {
  final int answer;

  const CheckAttendanceNextStep({required this.answer});
}

class CheckAttendancePreviousStep extends CheckAttendanceEvent {}

class CheckAttendanceSubmit extends CheckAttendanceEvent {}
