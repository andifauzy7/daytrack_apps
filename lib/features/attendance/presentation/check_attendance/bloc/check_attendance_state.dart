part of 'check_attendance_bloc.dart';

abstract class CheckAttendanceState extends Equatable {
  const CheckAttendanceState();

  @override
  List<Object> get props => [];
}

class CheckAttendanceInitial extends CheckAttendanceState {}

class CheckAttendanceNavigateBack extends CheckAttendanceState {}

class CheckAttendanceFinished extends CheckAttendanceState {}

class CheckAttendanceLoading extends CheckAttendanceState {}

class CheckAttendanceError extends CheckAttendanceState {
  final String errorMessage;

  const CheckAttendanceError({required this.errorMessage});
}

class CheckAttendanceLoaded extends CheckAttendanceState {
  final int indexPage;
  final User user;
  final List<Question> question;

  const CheckAttendanceLoaded({
    required this.indexPage,
    required this.user,
    required this.question,
  });
}
