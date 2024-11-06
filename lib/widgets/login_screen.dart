import 'package:flutter/material.dart';
import 'package:flutter_styled_widgets/constants/enums.dart';
import 'package:flutter_styled_widgets/shared/global_controller.dart';
import 'package:flutter_styled_widgets/widgets/home_screen.dart';
import 'package:flutter_styled_widgets/widgets/signup_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Color overlay to reduce the opacity of the background image
          Container(
            color: Colors.white.withOpacity(0.3), // Adjust the opacity as needed
          ),
          // Centered content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Styled Widgets',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1.0, color: Colors.brown.shade200),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1.0, color: Colors.brown.shade200),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      var usernameText = _usernameController.text.toLowerCase();

                      if (usernameText == UserRole.admin.name)
                      {
                        Get.find<GlobalController>().setRole(UserRole.admin);
                      }
                      else if (usernameText == UserRole.kitchen.name)
                      {
                        Get.find<GlobalController>().setRole(UserRole.kitchen);
                      }
                      else {
                        Get.find<GlobalController>().setRole(UserRole.user);
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 12.0),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white.withOpacity(0.5))
                    ),
                    onPressed: () {
                      // Navigate to the Sign-Up Page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpScreen()),
                      );
                    },
                    child: const Text(
                      'Don\'t have an account? Sign Up',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
