part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final List<AttendanceRecord> list;

  const HistoryLoaded({required this.list});
}

class HistoryError extends HistoryState {
  final String errorMessage;

  const HistoryError({required this.errorMessage});
}
