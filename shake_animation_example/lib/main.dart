import 'package:flutter/material.dart';

void main() {
  runApp(const ErrorShakeAnimationApp());
}

class ErrorShakeAnimationApp extends StatelessWidget {
  const ErrorShakeAnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Error Shake Animation',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late String _errorText;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _errorText = '';
  }

  @override
  void dispose() {
    _animationController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void shakeAnimation() {
    _animationController
      ..reset()
      ..forward();
  }

  void login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _errorText = 'Please enter username and password.';
      });
      shakeAnimation();
    } else {
      // Perform login logic here
      // ...
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                errorText: _errorText,
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: login,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const ShakeAnimationApp());
// }

// class ShakeAnimationApp extends StatelessWidget {
//   const ShakeAnimationApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Shake Animation App',
//       theme: ThemeData(primarySwatch: Colors.green),
//       home: const ShakeAnimationScreen(),
//     );
//   }
// }

// class ShakeAnimationScreen extends StatefulWidget {
//   const ShakeAnimationScreen({super.key});

//   @override
//   _ShakeAnimationScreenState createState() => _ShakeAnimationScreenState();
// }

// class _ShakeAnimationScreenState extends State<ShakeAnimationScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   void shakeAnimation() {
//     _animationController
//       ..reset()
//       ..forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Shake Animation App'),
//       ),
//       body: Center(
//         child: GestureDetector(
//           onTap: shakeAnimation,
//           child: AnimatedBuilder(
//             animation: _animationController,
//             builder: (context, child) {
//               return Transform.translate(
//                 offset: Offset(
//                   _animationController.value * -50,
//                   0,
//                 ),
//                 child: child,
//               );
//             },
//             child: Container(
//               width: 100,
//               height: 100,
//               color: Colors.red,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
