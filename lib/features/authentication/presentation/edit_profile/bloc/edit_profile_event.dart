part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object?> get props => [];
}

class EditProfileEmailChanged extends EditProfileEvent {
  const EditProfileEmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class EditProfileEmailUnfocused extends EditProfileEvent {}

class EditProfilePasswordChanged extends EditProfileEvent {
  const EditProfilePasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class EditProfilePasswordUnfocused extends EditProfileEvent {}

class EditProfileNameChanged extends EditProfileEvent {
  const EditProfileNameChanged({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}

class EditProfileAvatarChanged extends EditProfileEvent {
  const EditProfileAvatarChanged({required this.avatar});

  final Uint8List? avatar;

  @override
  List<Object?> get props => [avatar];
}

class EditProfileNameUnfocused extends EditProfileEvent {}

class EditProfileFormSubmitted extends EditProfileEvent {}
