import 'package:daytrack_apps/features/authentication/data/models/user_sign_in_model.dart';
import 'package:daytrack_apps/features/authentication/domain/entities/user_sign_in.dart';

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
}
