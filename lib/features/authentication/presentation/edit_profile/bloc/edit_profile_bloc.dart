import 'package:daytrack_apps/features/authentication/domain/entities/user.dart';
import 'package:daytrack_apps/features/authentication/domain/usecases/set_profile_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../sign_in/models/models.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final SetProfileUsecase setProfileUsecase;
  EditProfileBloc({required this.setProfileUsecase})
      : super(const EditProfileState()) {
    on<EditProfileAvatarChanged>(_onAvatarChanged);
    on<EditProfileNameChanged>(_onNameChanged);
    on<EditProfileEmailChanged>(_onEmailChanged);
    on<EditProfilePasswordChanged>(_onPasswordChanged);
    on<EditProfileNameUnfocused>(_onNameUnfocused);
    on<EditProfileEmailUnfocused>(_onEmailUnfocused);
    on<EditProfilePasswordUnfocused>(_onPasswordUnfocused);
    on<EditProfileFormSubmitted>(_onFormSubmitted);
  }

  void _onAvatarChanged(
      EditProfileAvatarChanged event, Emitter<EditProfileState> emit) {
    emit(
      state.copyWith(
        avatar: event.avatar,
      ),
    );
  }

  void _onNameChanged(
      EditProfileNameChanged event, Emitter<EditProfileState> emit) {
    final name = Name.dirty(event.name);
    emit(
      state.copyWith(
        name: name.valid ? name : Name.pure(event.name),
        status: Formz.validate([name, state.email, state.password]),
      ),
    );
  }

  void _onEmailChanged(
      EditProfileEmailChanged event, Emitter<EditProfileState> emit) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email.valid ? email : Email.pure(event.email),
        status: Formz.validate([email, state.name, state.password]),
      ),
    );
  }

  void _onPasswordChanged(
      EditProfilePasswordChanged event, Emitter<EditProfileState> emit) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password.valid ? password : Password.pure(event.password),
        status: Formz.validate([state.name, state.email, password]),
      ),
    );
  }

  void _onNameUnfocused(
    EditProfileNameUnfocused event,
    Emitter<EditProfileState> emit,
  ) {
    final name = Name.dirty(state.name.value);
    emit(
      state.copyWith(
        name: name,
        status: Formz.validate([state.email, name, state.password]),
      ),
    );
  }

  void _onEmailUnfocused(
      EditProfileEmailUnfocused event, Emitter<EditProfileState> emit) {
    final email = Email.dirty(state.email.value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.password, state.name]),
      ),
    );
  }

  void _onPasswordUnfocused(
    EditProfilePasswordUnfocused event,
    Emitter<EditProfileState> emit,
  ) {
    final password = Password.dirty(state.password.value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([state.email, password, state.name]),
      ),
    );
  }

  Future<void> _onFormSubmitted(
    EditProfileFormSubmitted event,
    Emitter<EditProfileState> emit,
  ) async {
    final name = Name.dirty(state.name.value);
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    final avatar = state.avatar;
    emit(
      state.copyWith(
        name: name,
        email: email,
        password: password,
        avatar: avatar,
        status: Formz.validate([name, email, password]),
      ),
    );
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      final setProfile = await setProfileUsecase(
        SetProfileParams(
          user: User(
            name: name.value,
            email: email.value,
            password: password.value,
            avatar: avatar,
          ),
        ),
      );
      await Future<void>.delayed(
        const Duration(seconds: 2),
      );

      setProfile.fold(
        (_) => emit(
          state.copyWith(status: FormzStatus.submissionFailure),
        ),
        (value) => emit(
          state.copyWith(status: FormzStatus.submissionSuccess),
        ),
      );
    }
  }
}
