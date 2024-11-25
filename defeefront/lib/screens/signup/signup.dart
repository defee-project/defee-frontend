import 'package:defeefront/widgets/input_box.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController blogLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            InputBox(
              labelText: "E-Mail",
              controller: emailController,
            ),
            const SizedBox(height: 10),
            InputBox(
              labelText: "Username",
              controller: usernameController,
            ),
            const SizedBox(height: 10),
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
            InputBox(
              labelText: "Confirm",
              isPassword: true,
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
              onPressed: () {
                print("회원가입 버튼 클릭");
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 50),
                backgroundColor: const Color.fromARGB(200, 0, 38, 134),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                "Sign up",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
