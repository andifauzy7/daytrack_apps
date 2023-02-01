part of 'edit_profile_bloc.dart';

class EditProfileState extends Equatable {
  const EditProfileState({
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.avatar,
  });

  final Name name;
  final Email email;
  final Password password;
  final Uint8List? avatar;
  final FormzStatus status;

  EditProfileState copyWith({
    Name? name,
    Email? email,
    Password? password,
    FormzStatus? status,
    Uint8List? avatar,
  }) {
    return EditProfileState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  List<Object?> get props => [name, email, password, status, avatar];
}
