import 'package:flutter/material.dart';
import 'package:flutter_app_desvita/Screen/page_signup.dart';
import 'package:flutter_app_desvita/Screen/user_data.dart';
import 'package:flutter_app_desvita/Screen/page_home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  bool _isLoading = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _handleLogin() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    String inputEmail = _emailController.text;
    String inputPassword = _passwordController.text;

    if (inputEmail == UserData.email && inputPassword == UserData.password) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Berhasil', style: TextStyle(fontFamily: 'Fredeka'))),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email / Password salah', style: TextStyle(fontFamily: 'Fredeka'))),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          SafeArea(
            child: Column(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFCC4D),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 40,
                        left: 16,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Fredeka',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'Welcome',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Fredeka'),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Lorem ipsum dolor sit amet...',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54, fontFamily: 'Fredeka'),
                        ),
                        const SizedBox(height: 20),
                        const Text('Email or Mobile Number', style: TextStyle(fontFamily: 'Fredeka')),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _emailController,
                          style: const TextStyle(fontFamily: 'Fredeka'),
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFFFF0B3),
                            filled: true,
                            hintText: 'example@example.com',
                            hintStyle: const TextStyle(fontFamily: 'Fredeka'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text('Password', style: TextStyle(fontFamily: 'Fredeka')),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          style: const TextStyle(fontFamily: 'Fredeka'),
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFFFF0B3),
                            filled: true,
                            hintText: '*************',
                            hintStyle: const TextStyle(fontFamily: 'Fredeka'),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword ? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text('Remember me', style: TextStyle(fontFamily: 'Fredeka')),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Forgot password?', style: TextStyle(fontFamily: 'Fredeka')),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _handleLogin,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF5722),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: _isLoading
                                ? const CircularProgressIndicator(color: Colors.white)
                                : const Text('Log In', style: TextStyle(fontFamily: 'Fredeka')),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const SignupPage()),
                              );
                            },
                            child: RichText(
                              text: const TextSpan(
                                text: 'Don’t have an account? ',
                                style: TextStyle(color: Colors.black, fontFamily: 'Fredeka'),
                                children: [
                                  TextSpan(
                                    text: 'Sign up',
                                    style: TextStyle(color: Colors.orange, fontFamily: 'Fredeka'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}