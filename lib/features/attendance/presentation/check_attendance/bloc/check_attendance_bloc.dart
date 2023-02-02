import 'package:daytrack_apps/core/usecase/usecase.dart';
import 'package:daytrack_apps/features/attendance/domain/entities/attendance_record.dart';
import 'package:daytrack_apps/features/attendance/domain/entities/question.dart';
import 'package:daytrack_apps/features/attendance/domain/usecases/get_questions_usecase.dart';
import 'package:daytrack_apps/features/attendance/domain/usecases/set_attendace_record_usecase.dart';
import 'package:daytrack_apps/features/attendance/domain/usecases/update_attendace_record_usecase.dart';
import 'package:daytrack_apps/features/attendance/presentation/check_attendance/pages/check_attendance_page.dart';
import 'package:daytrack_apps/features/authentication/domain/entities/user.dart';
import 'package:daytrack_apps/features/authentication/domain/usecases/get_profile_usecase.dart';
import 'package:daytrack_apps/shared/determine_position.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

part 'check_attendance_event.dart';
part 'check_attendance_state.dart';

class CheckAttendanceBloc
    extends Bloc<CheckAttendanceEvent, CheckAttendanceState> {
  final GetQuestionsUsecase getQuestionsUsecase;
  final GetProfileUsecase getProfileUsecase;
  final SetAttendanceRecordUsecase setAttendanceRecordUsecase;
  final UpdateAttendanceRecordUsecase updateAttendanceRecordUsecase;

  int indexPage = 0;
  late final User user;
  late Position position;
  late List<Question> question;
  AttendanceRecord attendanceRecord = AttendanceRecord();

  CheckAttendanceBloc({
    required this.getQuestionsUsecase,
    required this.getProfileUsecase,
    required this.setAttendanceRecordUsecase,
    required this.updateAttendanceRecordUsecase,
  }) : super(CheckAttendanceInitial()) {
    on<CheckAttendanceFetchData>(_fetchDataHandle);
    on<CheckAttendancePreviousStep>(_fetchPreviousStep);
    on<CheckAttendanceNextStep>(_fetchNextStep);
    on<CheckAttendanceSubmit>(_fetchSubmitHandle);
  }

  Future<void> _fetchSubmitHandle(
    CheckAttendanceSubmit event,
    Emitter<CheckAttendanceState> emit,
  ) async {
    emit(CheckAttendanceLoading());

    if (attendanceRecord.checkIn == null) {
      attendanceRecord.checkIn = DateTime.now();
      final setAttendance = await setAttendanceRecordUsecase(
        SetAttendanceParams(attendanceRecord: attendanceRecord),
      );
      setAttendance.fold(
        (err) => emit(
          CheckAttendanceError(
            errorMessage: err.toString(),
          ),
        ),
        (valueUser) => emit(CheckAttendanceFinished()),
      );
    } else {
      final updateAttendance = await updateAttendanceRecordUsecase(
        UpdateAttendanceParams(attendanceRecord: attendanceRecord),
      );
      updateAttendance.fold(
        (err) => emit(
          CheckAttendanceError(
            errorMessage: err.toString(),
          ),
        ),
        (valueUser) => emit(CheckAttendanceFinished()),
      );
    }
  }

  Future<void> _fetchNextStep(
    CheckAttendanceNextStep event,
    Emitter<CheckAttendanceState> emit,
  ) async {
    emit(CheckAttendanceLoading());

    question[indexPage].answer = event.answer;
    if (indexPage == 0) {
      // Condition
      attendanceRecord.condition = question[indexPage];
    }
    if (indexPage == 1) {
      // Location

      attendanceRecord.latitude = position.latitude;
      attendanceRecord.langitude = position.longitude;
      attendanceRecord.location = question[indexPage];
    }
    if (indexPage == 2) {
      // Survey
      attendanceRecord.survey = question[indexPage];
    }

    indexPage += 1;

    emit(
      CheckAttendanceLoaded(
        attendanceRecord: attendanceRecord,
        indexPage: indexPage,
        user: user,
        question: question,
      ),
    );
  }

  Future<void> _fetchPreviousStep(
    CheckAttendancePreviousStep event,
    Emitter<CheckAttendanceState> emit,
  ) async {
    emit(CheckAttendanceLoading());
    indexPage -= 1;
    if (indexPage < 0) {
      emit(CheckAttendanceNavigateBack());
    } else {
      emit(
        CheckAttendanceLoaded(
          attendanceRecord: attendanceRecord,
          indexPage: indexPage,
          user: user,
          question: question,
        ),
      );
    }
  }

  Future<void> _fetchDataHandle(
    CheckAttendanceFetchData event,
    Emitter<CheckAttendanceState> emit,
  ) async {
    emit(CheckAttendanceLoading());
    position = await determinePosition();

    if (event.args.attendanceRecord != null) {
      attendanceRecord = event.args.attendanceRecord!;
    } else {
      attendanceRecord.dateTime = DateTime.now();
    }

    final getProfile = await getProfileUsecase(
      NoParams(),
    );
    getProfile.fold(
      (err) => emit(
        CheckAttendanceError(
          errorMessage: err.toString(),
        ),
      ),
      (valueUser) => user = valueUser,
    );

    final getQuestions = await getQuestionsUsecase(
      NoParams(),
    );
    getQuestions.fold(
      (err) => emit(
        CheckAttendanceError(
          errorMessage: err.toString(),
        ),
      ),
      (valueQuestion) {
        question = valueQuestion;
        emit(
          CheckAttendanceLoaded(
            attendanceRecord: attendanceRecord,
            indexPage: indexPage,
            user: user,
            question: question,
          ),
        );
      },
    );
  }
}
