import 'package:flutter/material.dart';
import 'package:flutter_app_desvita/Screen/welcome.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9C74F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'gambar/hatikuning.png', // Pastikan gambar ada di folder assets
              width: 300,
              height: 300,
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFDF0D5),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              ),
              child: Text('Mulai', style: TextStyle(color: Colors.deepOrange)),
            ),
          ],
        ),
      ),
    );
  }
}
