import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final String labelText;
  final bool isPassword;
  final bool isPasswordVisible;
  final void Function()? togglePasswordVisibility;
  final TextEditingController? controller;

  const InputBox({
    super.key,
    required this.labelText,
    this.isPassword = false,
    this.isPasswordVisible = false,
    this.togglePasswordVisibility,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 80,
            child: Text(
              "$labelText :",
              style: const TextStyle(
                fontSize: 13,
                color: Color.fromARGB(255, 97, 97, 97),
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 200,
            child: TextFormField(
              controller: controller,
              obscureText: isPassword && !isPasswordVisible,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                isDense: true,
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 97, 97, 97),
                  ),
                ),
                suffixIcon: isPassword
                    ? IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: togglePasswordVisibility,
                      )
                    : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
