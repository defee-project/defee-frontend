import 'package:defeefront/widgets/basescreen.dart';
import 'package:defeefront/widgets/input_box.dart';
import 'package:defeefront/widgets/input_pw_box.dart';
import 'package:defeefront/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:defeefront/provider/auth_provider.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  bool _isPasswordVisible = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('이메일과 비밀번호를 입력해주세요.')),
      );
      return;
    }

    final authController = ref.read(authControllerProvider.notifier);
    await authController.login(emailController.text, passwordController.text);
  }

  void _handleGoogleLogin() async {
    final authController = ref.read(authControllerProvider.notifier);
    await authController.googleLogin();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authControllerProvider, (previous, next) {
      next.whenOrNull(
        data: (_) {
          Navigator.pushNamed(context, '/');
        },
        error: (error, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.toString())),
          );
        },
      );
    });

    return BaseScreen(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 로고 부분은 동일...
            const Column(
              children: [
                Text(
                  "{ }",
                  style: TextStyle(
                    fontSize: 50,
                    color: DefeeColors.blue,
                  ),
                ),
                Text(
                  "defee;",
                  style: TextStyle(
                    fontSize: 30,
                    color: DefeeColors.blue,
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
            InputBox(
              labelText: "E-Mail",
              controller: emailController,
            ),
            const SizedBox(height: 20),
            InputPwBox(
              labelText: "Password",
              isPasswordVisible: _isPasswordVisible,
              togglePasswordVisibility: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              controller: passwordController,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("아직 회원이 아니신가요?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text("회원가입",
                      style: TextStyle(color: DefeeColors.blue)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleLogin,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 50),
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: DefeeThemeSizes.primaryBorderRadius,
                ),
              ),
              child: ref.watch(authControllerProvider).maybeWhen(
                    loading: () => const CircularProgressIndicator(
                      color: DefeeColors.white,
                    ),
                    orElse: () => const Text(
                      "Log In",
                      style: TextStyle(color: DefeeColors.white),
                    ),
                  ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _handleGoogleLogin,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 50),
                backgroundColor: Theme.of(context).colorScheme.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: DefeeThemeSizes.primaryBorderRadius,
                  side:
                      const BorderSide(color: DefeeColors.surfaceContainerGrey),
                ),
              ),
              icon: ref.watch(authControllerProvider).maybeWhen(
                    loading: () => const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(),
                    ),
                    orElse: () => Image.asset(
                      "assets/images/google.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
              label: const Text(
                "SIGN IN WITH GOOGLE",
                style: TextStyle(color: DefeeColors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
