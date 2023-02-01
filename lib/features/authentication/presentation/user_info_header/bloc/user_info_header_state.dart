part of 'user_info_header_bloc.dart';

abstract class UserInfoHeaderState extends Equatable {
  const UserInfoHeaderState();

  @override
  List<Object> get props => [];
}

class UserInfoHeaderInitial extends UserInfoHeaderState {}

class UserInfoHeaderLoading extends UserInfoHeaderState {}

class UserInfoHeaderLoaded extends UserInfoHeaderState {
  final User user;

  const UserInfoHeaderLoaded({required this.user});
}

class UserInfoHeaderError extends UserInfoHeaderState {
  final String errorMessage;

  const UserInfoHeaderError({required this.errorMessage});
}
