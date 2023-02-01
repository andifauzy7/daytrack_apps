import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';

class MainBloc extends Bloc<MainEvent, int> {
  MainBloc() : super(0) {
    on<MainEvent>((event, emit) {
      emit(event.index);
    });
  }
}
