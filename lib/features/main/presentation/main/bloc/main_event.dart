part of 'main_bloc.dart';

class MainEvent extends Equatable {
  final int index;

  const MainEvent({required this.index});

  @override
  List<Object> get props => [index];
}
