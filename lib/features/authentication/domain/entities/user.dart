import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String password;
  final Uint8List? avatar;

  const User({
    required this.name,
    required this.email,
    required this.password,
    this.avatar,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        avatar,
      ];
}
