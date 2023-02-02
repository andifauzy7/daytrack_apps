part of 'attendance_card_bloc.dart';

abstract class AttendanceCardEvent extends Equatable {
  const AttendanceCardEvent();

  @override
  List<Object> get props => [];
}

class AttendanceCardFetchData extends AttendanceCardEvent {}
