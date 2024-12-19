import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:defeefront/models/signup_model.dart';
import 'package:defeefront/models/user_model.dart';
import 'package:defeefront/models/login_model.dart';
import 'package:defeefront/repositories/auth_repository.dart';

final emailVerificationProvider = StateProvider<bool>((ref) => false);

final userProvider = StateProvider<UserModel?>((ref) => null);

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<void>>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthController(repository, ref);
});

class AuthController extends StateNotifier<AsyncValue<void>> {
  final AuthRepository _repository;
  final Ref _ref;

  AuthController(this._repository, this._ref)
      : super(const AsyncValue.data(null));

  Future<void> sendEmailVerification(String email) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.sendEmailVerification(email);
      _ref.read(emailVerificationProvider.notifier).state = true;
    });
  }

  Future<void> verifyCode(String email, String code) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.verifyCode(email, code));
  }

  Future<bool> checkUsername(String username) async {
    try {
      return await _repository.checkUsername(username);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      return false;
    }
  }

  Future<void> signup(SignupModel data) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.signup(data);
      _ref.read(emailVerificationProvider.notifier).state = false;
    });
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final loginData = LoginModel(email: email, password: password);
      final user = await _repository.login(loginData);
      _ref.read(userProvider.notifier).state = user;
    });
  }

  Future<void> googleLogin() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final user = await _repository.googleLogin();
      _ref.read(userProvider.notifier).state = user;
    });
  }

  void logout() {
    _ref.read(userProvider.notifier).state = null;
    _ref.read(emailVerificationProvider.notifier).state = false;
  }
}
