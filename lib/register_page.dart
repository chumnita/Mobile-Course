import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'welcome_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            const SizedBox(height: 60),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Register new",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato',
                  ),
                ),
                Text(
                  "account",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Image.asset(
                  'assets/images/accent.png',
                  height: 3,
                ), // Align to the left
              ],
            ),
            const SizedBox(height: 45),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                filled: true,
                fillColor: Color(0xFFF2F2F2),
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 30),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: Icon(Icons.visibility),
                filled: true,
                fillColor: Color(0xFFF2F2F2),
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 30),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password Confirmation',
                suffixIcon: Icon(Icons.visibility),
                filled: true,
                fillColor: Color(0xFFF2F2F2),
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 35),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(value: false, onChanged: (_) {}),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: "By creating an account, you agree to our ",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Terms & Conditions",
                          style: const TextStyle(color: Colors.blue),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  // Handle Terms & Conditions click
                                },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const WelcomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size.fromHeight(48),
              ),
              child: const Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
