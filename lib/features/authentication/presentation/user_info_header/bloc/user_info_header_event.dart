part of 'user_info_header_bloc.dart';

abstract class UserInfoHeaderEvent extends Equatable {
  const UserInfoHeaderEvent();

  @override
  List<Object> get props => [];
}

class UserInfoHeaderFetch extends UserInfoHeaderEvent {}
