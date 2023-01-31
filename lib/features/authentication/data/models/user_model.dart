class UserModel {
  final String name;
  final String email;
  final String password;
  final String? avatar;

  const UserModel({
    required this.name,
    required this.email,
    required this.password,
    this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      avatar: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'avatar': avatar,
    };
  }
}
