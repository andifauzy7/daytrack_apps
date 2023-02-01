part of 'timeline_bloc.dart';

abstract class TimelineState extends Equatable {
  const TimelineState();

  @override
  List<Object> get props => [];
}

class TimelineInitial extends TimelineState {}

class TimelineLoading extends TimelineState {}

class TimelineLoaded extends TimelineState {
  final List<News> news;
  const TimelineLoaded({required this.news});
}

class TimelineError extends TimelineState {
  final String message;
  const TimelineError({required this.message});
}
