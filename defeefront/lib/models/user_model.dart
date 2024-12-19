class UserModel {
  final String email;
  final String token;

  UserModel({
    required this.email,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['sub'] ?? '',
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'token': token,
      };

  Map<String, dynamic> toStorage() => {
        'email': email,
        'token': token,
      };

  factory UserModel.fromStorage(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] ?? '',
      token: json['token'] ?? '',
    );
  }
}
