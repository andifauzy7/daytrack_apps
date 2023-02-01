import 'package:daytrack_apps/core/usecase/usecase.dart';
import 'package:daytrack_apps/features/authentication/domain/entities/user.dart';
import 'package:daytrack_apps/features/authentication/domain/usecases/get_profile_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUsecase getProfileUsecase;
  late User user;
  ProfileBloc({required this.getProfileUsecase}) : super(ProfileInitial()) {
    on<ProfileFetchData>(_fetchDataHandler);
  }

  Future<void> _fetchDataHandler(
    ProfileFetchData event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    final loginSession = await getProfileUsecase(
      NoParams(),
    );
    loginSession.fold(
        (err) => emit(
              ProfileError(
                errorMessage: err.toString(),
              ),
            ), (value) {
      user = value;
      emit(
        ProfileLoaded(user: value),
      );
    });
  }
}
