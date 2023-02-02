import 'package:daytrack_apps/core/service_locator/service_locator.dart';
import 'package:daytrack_apps/features/attendance/data/datasources/attendance_local_data_source.dart';
import 'package:daytrack_apps/features/attendance/data/datasources/attendance_remote_data_source.dart';
import 'package:daytrack_apps/features/attendance/data/repositories/attendance_repository_impl.dart';
import 'package:daytrack_apps/features/attendance/domain/repositories/attendance_repository.dart';
import 'package:daytrack_apps/features/attendance/domain/usecases/get_attendance_record_usecase.dart';
import 'package:daytrack_apps/features/attendance/domain/usecases/get_questions_usecase.dart';
import 'package:daytrack_apps/features/attendance/domain/usecases/set_attendace_record_usecase.dart';
import 'package:daytrack_apps/features/attendance/domain/usecases/update_attendace_record_usecase.dart';
import 'package:daytrack_apps/features/attendance/presentation/attendance_card/bloc/attendance_card_bloc.dart';
import 'package:daytrack_apps/features/attendance/presentation/check_attendance/bloc/check_attendance_bloc.dart';

class AttendanceDependencies {
  AttendanceDependencies() {
    _registerUseCase();
    _registerRepository();
    _registerDataSource();
    _registerController();
  }

  void _registerUseCase() {
    sl.registerLazySingleton<GetQuestionsUsecase>(
      () => GetQuestionsUsecase(
        sl(),
      ),
    );
    sl.registerLazySingleton<SetAttendanceRecordUsecase>(
      () => SetAttendanceRecordUsecase(
        sl(),
      ),
    );
    sl.registerLazySingleton<GetAttendanceRecordUsecase>(
      () => GetAttendanceRecordUsecase(
        sl(),
      ),
    );
    sl.registerLazySingleton<UpdateAttendanceRecordUsecase>(
      () => UpdateAttendanceRecordUsecase(
        sl(),
      ),
    );
  }

  void _registerRepository() {
    sl.registerLazySingleton<AttendanceRepository>(
      () => AttendanceRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ),
    );
  }

  void _registerDataSource() {
    sl.registerLazySingleton<AttendanceRemoteDataSource>(
      () => AttendanceRemoteDataSourceImpl(
        client: sl(),
      ),
    );
    sl.registerLazySingleton<AttendanceLocalDataSource>(
      () => AttendanceLocalDataSourceImpl(
        sharedPreferences: sl(),
      ),
    );
  }

  void _registerController() {
    sl.registerFactory(
      () => CheckAttendanceBloc(
        getQuestionsUsecase: sl(),
        getProfileUsecase: sl(),
        setAttendanceRecordUsecase: sl(),
        updateAttendanceRecordUsecase: sl(),
      ),
    );
    sl.registerFactory(
      () => AttendanceCardBloc(
        getAttendanceRecordUsecase: sl(),
      ),
    );
  }
}
