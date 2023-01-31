import 'package:equatable/equatable.dart';

class UserSignIn extends Equatable {
  final String email;
  final String password;

  const UserSignIn({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
