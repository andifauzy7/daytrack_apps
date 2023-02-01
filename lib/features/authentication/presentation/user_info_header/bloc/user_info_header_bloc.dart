import 'package:daytrack_apps/core/usecase/usecase.dart';
import 'package:daytrack_apps/features/authentication/domain/entities/user.dart';
import 'package:daytrack_apps/features/authentication/domain/usecases/get_profile_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_info_header_event.dart';
part 'user_info_header_state.dart';

class UserInfoHeaderBloc
    extends Bloc<UserInfoHeaderEvent, UserInfoHeaderState> {
  final GetProfileUsecase getProfileUsecase;
  UserInfoHeaderBloc({required this.getProfileUsecase})
      : super(UserInfoHeaderInitial()) {
    on<UserInfoHeaderEvent>(_fetchUserInfoHandle);
  }

  Future<void> _fetchUserInfoHandle(
    UserInfoHeaderEvent event,
    Emitter<UserInfoHeaderState> emit,
  ) async {
    emit(UserInfoHeaderLoading());
    final loginSession = await getProfileUsecase(
      NoParams(),
    );
    loginSession.fold(
      (err) => emit(
        UserInfoHeaderError(
          errorMessage: err.toString(),
        ),
      ),
      (value) => emit(
        UserInfoHeaderLoaded(user: value),
      ),
    );
  }
}
