import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'check_attendance_event.dart';
part 'check_attendance_state.dart';

class CheckAttendanceBloc
    extends Bloc<CheckAttendanceEvent, CheckAttendanceState> {
  CheckAttendanceBloc() : super(CheckAttendanceInitial()) {
    on<CheckAttendanceEvent>((event, emit) {});
  }
}
