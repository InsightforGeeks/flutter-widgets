import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.title});

  final String title;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1662BE),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Finding the Perfect',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Online Course for You',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Our online tutoring program uses a flexible',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const Text(
                'approach to develop skills based on individual talents',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Image(
                  height: 300,
                  width: 300,
                  image: AssetImage('assets/girl_image.png')),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.amber[700],
                      elevation: 4,
                      padding: const EdgeInsets.all(16),
                    ),
                    onPressed: () {},
                    child: const Text('Register',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  )),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Already have an Account? Log In',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
