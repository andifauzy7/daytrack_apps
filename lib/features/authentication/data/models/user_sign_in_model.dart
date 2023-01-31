class UserSignInModel {
  final String email;
  final String password;
  const UserSignInModel({
    required this.email,
    required this.password,
  });

  factory UserSignInModel.fromJson(Map<String, dynamic> json) {
    return UserSignInModel(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
