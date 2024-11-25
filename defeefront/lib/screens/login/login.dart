import 'package:defeefront/widgets/basescreen.dart';
import 'package:defeefront/widgets/input_box.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isPasswordVisible = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 로고
            const Column(
              children: [
                Text(
                  "{ }",
                  style: TextStyle(
                    fontSize: 50,
                    color: Color.fromARGB(255, 0, 38, 134),
                  ),
                ),
                Text(
                  "defee;",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 0, 38, 134),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
            // 이메일 입력 필드
            InputBox(
              labelText: "E-Mail",
              controller: emailController,
            ),
            const SizedBox(height: 20),
            // 비밀번호 입력 필드
            InputBox(
              labelText: "Password",
              isPassword: true,
              isPasswordVisible: _isPasswordVisible,
              togglePasswordVisibility: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              controller: passwordController,
            ),
            const SizedBox(height: 10),
            // 회원가입 링크
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("아직 회원이 아니신가요?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text(
                    "회원가입",
                    style: TextStyle(color: Color.fromARGB(255, 97, 97, 97)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // 로그인 버튼
            ElevatedButton(
              onPressed: () {
                print("로그인 버튼 클릭");
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 50),
                backgroundColor: const Color.fromARGB(200, 0, 38, 134),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                "Log In",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            // 소셜 로그인 버튼
            ElevatedButton.icon(
              onPressed: () {
                print("Google 로그인 버튼 클릭");
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 50),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(color: Colors.black12),
                ),
              ),
              icon: Image.asset(
                "assets/images/google.png",
                width: 20,
                height: 20,
              ),
              label: const Text(
                "SIGN IN WITH GOOGLE",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
