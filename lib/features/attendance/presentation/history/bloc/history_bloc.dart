import 'package:daytrack_apps/core/usecase/usecase.dart';
import 'package:daytrack_apps/features/attendance/domain/entities/attendance_record.dart';
import 'package:daytrack_apps/features/attendance/domain/usecases/get_list_attendance_record_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final GetListAttendanceRecordUsecase getListAttendanceRecordUsecase;
  HistoryBloc({required this.getListAttendanceRecordUsecase})
      : super(HistoryInitial()) {
    on<HistoryEvent>((event, emit) async {
      if (event is HistoryFetchData) {
        emit(HistoryLoading());
        final listAttendance = await getListAttendanceRecordUsecase(
          NoParams(),
        );
        listAttendance.fold(
          (err) => emit(
            HistoryError(
              errorMessage: err.toString(),
            ),
          ),
          (value) => emit(
            HistoryLoaded(list: value),
          ),
        );
      }
    });
  }
}
