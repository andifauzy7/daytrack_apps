import 'package:daytrack_apps/features/attendance/domain/entities/attendance_record.dart';
import 'package:daytrack_apps/features/attendance/domain/usecases/get_attendance_record_usecase.dart';
import 'package:daytrack_apps/features/attendance/presentation/attendance_card/enum/home_attendance_card_type.dart';
import 'package:daytrack_apps/shared/constants_value.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'attendance_card_event.dart';
part 'attendance_card_state.dart';

class AttendanceCardBloc
    extends Bloc<AttendanceCardEvent, AttendanceCardState> {
  final GetAttendanceRecordUsecase getAttendanceRecordUsecase;

  AttendanceCardBloc({
    required this.getAttendanceRecordUsecase,
  }) : super(AttendanceCardInitial()) {
    on<AttendanceCardEvent>((event, emit) async {
      if (event is AttendanceCardFetchData) {
        emit(AttendanceCardLoading());
        final dateTimeString = DateFormat(ConstantsValue.date).format(
          DateTime.now(),
        );
        final loginSession = await getAttendanceRecordUsecase(
          GetAttendanceParams(
            date: DateTime.parse(dateTimeString),
          ),
        );
        loginSession.fold(
          (err) => emit(
            const AttendanceCardLoaded(
              type: HomeAttendanceCardType.checkIn,
            ),
          ),
          (value) {
            if (value.checkOut == null) {
              emit(
                AttendanceCardLoaded(
                  attendanceRecord: value,
                  type: HomeAttendanceCardType.checkOut,
                ),
              );
            }
            emit(
              AttendanceCardLoaded(
                attendanceRecord: value,
                type: HomeAttendanceCardType.finished,
              ),
            );
          },
        );
      }
    });
  }
}
