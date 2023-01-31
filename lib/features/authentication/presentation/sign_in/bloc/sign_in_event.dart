part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInEmailChanged extends SignInEvent {
  const SignInEmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class SignInEmailUnfocused extends SignInEvent {}

class SignInPasswordChanged extends SignInEvent {
  const SignInPasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class SignInPasswordUnfocused extends SignInEvent {}

class SignInFormSubmitted extends SignInEvent {}
