import 'package:daytrack_apps/features/authentication/data/models/user_model.dart';
import 'package:daytrack_apps/features/authentication/data/models/user_sign_in_model.dart';
import 'package:daytrack_apps/features/authentication/domain/entities/user.dart';
import 'package:daytrack_apps/features/authentication/domain/entities/user_sign_in.dart';
import 'package:flutter/foundation.dart';

class AuthenticationMapper {
  static UserSignIn convertUserSignInModelToUserSignIn(
          UserSignInModel userSignInModel) =>
      UserSignIn(
        email: userSignInModel.email,
        password: userSignInModel.password,
      );

  static UserSignInModel convertUserSignInToUserSignInModel(
          UserSignIn userSignInModel) =>
      UserSignInModel(
        email: userSignInModel.email,
        password: userSignInModel.password,
      );

  static User convertUserModelToUser(UserModel userModel) => User(
        email: userModel.email,
        password: userModel.password,
        name: userModel.name,
        avatar: userModel.avatar != null
            ? Uint8List.fromList(userModel.avatar!.codeUnits)
            : null,
      );

  static UserModel convertUserToUserModel(User user) => UserModel(
        email: user.email,
        password: user.password,
        name: user.name,
        avatar: user.avatar != null ? String.fromCharCodes(user.avatar!) : null,
      );
}
