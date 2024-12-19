import 'package:defeefront/widgets/input_box.dart';
import 'package:defeefront/widgets/input_btn_box.dart';
import 'package:defeefront/widgets/input_pw_box.dart';
import 'package:flutter/material.dart';
import 'package:defeefront/themes/app_theme.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isFormValid = false;
  bool _isEmailVerified = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController blogLinkController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // 입력값 변경 감지
    emailController.addListener(_validateForm);
    codeController.addListener(_validateForm);
    usernameController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
    confirmPasswordController.addListener(_validateForm);
    blogLinkController.addListener(_validateForm);
  }

  @override
  void dispose() {
    // 컨트롤러 해제
    emailController.dispose();
    codeController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    blogLinkController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _isFormValid = emailController.text.isNotEmpty &&
          (_isEmailVerified ? codeController.text.isNotEmpty : true) &&
          usernameController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty &&
          passwordController.text == confirmPasswordController.text;
    });
  }

  // 이메일 전송
  void _sendEmail() {
    final email = emailController.text;
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (email.isEmpty) {
      print("이메일을 입력해주세요.");
      return;
    } else if (!emailRegExp.hasMatch(email)) {
      print("올바른 이메일 형식이 아닙니다.");
      return;
    }

    setState(() {
      _isEmailVerified = true;
    });

    print("이메일 전송: $email");
  }

  // 코드 인증
  void _verifyCode() {
    final code = codeController.text;

    if (code.isEmpty) {
      print("코드를 입력해주세요.");
      return;
    }

    print("코드 인증: $code");
  }

  // 닉네임 중복체크
  void _checkUsername() {
    final username = usernameController.text;

    if (username.isEmpty) {
      print("유저네임을 입력해주세요.");
      return;
    }

    print("유저네임 체크: $username");
  }

  void _onSignUp() {
    if (!_isFormValid) return;

    final email = emailController.text;
    final code = codeController.text;
    final username = usernameController.text;
    final password = passwordController.text;
    final blogLink = blogLinkController.text;

    print("E-mail: $email");
    print("Code: $code");
    print("Username: $username");
    print("Password: $password");
    print("Blog Link: $blogLink");

    print("회원가입 성공!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            InputBtnBox(
              labelText: "E-Mail",
              controller: emailController,
              buttonText: "전송",
              onButtonPressed: _sendEmail,
              isButtonEnabled: emailController.text.isNotEmpty,
            ),
            const SizedBox(height: 10),
            if (_isEmailVerified) ...[
              InputBtnBox(
                labelText: "Code",
                controller: codeController,
                buttonText: "인증",
                onButtonPressed: _verifyCode,
                isButtonEnabled: codeController.text.isNotEmpty,
              ),
              const SizedBox(height: 10),
            ],
            InputBtnBox(
              labelText: "Username",
              controller: usernameController,
              buttonText: "체크",
              onButtonPressed: _checkUsername,
              isButtonEnabled: usernameController.text.isNotEmpty,
            ),
            const SizedBox(height: 10),
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
            InputPwBox(
              labelText: "Confirm",
              isPasswordVisible: _isConfirmPasswordVisible,
              togglePasswordVisibility: () {
                setState(() {
                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                });
              },
              controller: confirmPasswordController,
            ),
            const SizedBox(height: 10),
            InputBox(
              labelText: "Blog Link",
              controller: blogLinkController,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _isFormValid ? _onSignUp : null,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(350, 50),
                backgroundColor: DefeeColors.blue,
                disabledBackgroundColor: DefeeColors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: DefeeThemeSizes.primaryBorderRadius,
                ),
              ),
              child: const Text(
                "Sign up",
                style: TextStyle(color: DefeeColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
