class SignupModel {
  final String email;
  final String code;
  final String username;
  final String password;
  final String? blogUrl;

  SignupModel({
    required this.email,
    required this.code,
    required this.username,
    required this.password,
    this.blogUrl,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'code': code,
        'username': username,
        'password': password,
        if (blogUrl != null) 'blogUrl': blogUrl,
      };

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      email: json['email'],
      code: json['code'],
      username: json['username'],
      password: json['password'],
      blogUrl: json['blogUrl'],
    );
  }
}
