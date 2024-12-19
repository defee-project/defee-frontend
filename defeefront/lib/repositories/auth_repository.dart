import 'package:defeefront/models/login_model.dart';
import 'package:defeefront/models/signup_model.dart'; // SignupModel import 추가
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:defeefront/models/user_model.dart';
import 'package:defeefront/service/dio_services.dart';

class AuthRepository {
  final Dio _dio;

  AuthRepository(this._dio);

  Future<void> sendEmailVerification(String email) async {
    await _dio.post('/email', data: {'email': email});
  }

  Future<void> verifyCode(String email, String code) async {
    await _dio.post('/verify', data: {
      'email': email,
      'code': code,
    });
  }

  Future<bool> checkUsername(String username) async {
    final response = await _dio.get('/check-username/$username');
    return response.data['available'];
  }

  Future<void> signup(SignupModel data) async {
    await _dio.post('/members/signup', data: data.toJson());
  }

  Future<UserModel> login(LoginModel loginData) async {
    try {
      final response = await _dio.post(
        '/members/login',
        data: loginData.toJson(),
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      }
      throw '로그인에 실패했습니다.';
    } on DioException catch (e) {
      throw '로그인 중 오류가 발생했습니다: ${e.message}';
    }
  }

  Future<UserModel> googleLogin() async {
    try {
      final response = await _dio.post('/members/google');
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw '구글 로그인 중 오류가 발생했습니다.';
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRepository(dio);
});
