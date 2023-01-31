import 'package:daytrack_apps/features/authentication/domain/entities/user_sign_in.dart';
import 'package:daytrack_apps/features/authentication/domain/usecases/set_login_session_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../models/models.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SetLoginSessionUsecase setLoginSessionUsecase;
  SignInBloc({required this.setLoginSessionUsecase})
      : super(const SignInState()) {
    on<SignInEmailChanged>(_onEmailChanged);
    on<SignInPasswordChanged>(_onPasswordChanged);
    on<SignInEmailUnfocused>(_onEmailUnfocused);
    on<SignInPasswordUnfocused>(_onPasswordUnfocused);
    on<SignInFormSubmitted>(_onFormSubmitted);
  }

  void _onEmailChanged(SignInEmailChanged event, Emitter<SignInState> emit) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email.valid ? email : Email.pure(event.email),
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  void _onPasswordChanged(
      SignInPasswordChanged event, Emitter<SignInState> emit) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password.valid ? password : Password.pure(event.password),
        status: Formz.validate([state.email, password]),
      ),
    );
  }

  void _onEmailUnfocused(
      SignInEmailUnfocused event, Emitter<SignInState> emit) {
    final email = Email.dirty(state.email.value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  void _onPasswordUnfocused(
    SignInPasswordUnfocused event,
    Emitter<SignInState> emit,
  ) {
    final password = Password.dirty(state.password.value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([state.email, password]),
      ),
    );
  }

  Future<void> _onFormSubmitted(
    SignInFormSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    emit(
      state.copyWith(
        email: email,
        password: password,
        status: Formz.validate([email, password]),
      ),
    );
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final setSession = await setLoginSessionUsecase(
        SetLoginSessionParams(
          user: UserSignIn(
            email: email.value,
            password: password.value,
          ),
        ),
      );
      await Future<void>.delayed(
        const Duration(seconds: 2),
      );
      setSession.fold(
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
