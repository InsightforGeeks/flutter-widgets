import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  bool isordered = false;
  bool iscompleted = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(1.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void startAnimation() {
    _animationController.reset();
    _animationController.forward();
    Future.delayed(const Duration(seconds: 2), () {
      _animationController.reverse();
      Future.delayed(const Duration(seconds: 2), () {
        _animationController.forward();
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            isordered = true;
          });
        });
      });
    });

    // setState(() {
    //   iscompleted = true;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _animation,
              child: SizedBox(
                width: 150,
                height: 70,
                child: Image.asset(
                  'assets/truck_delivery.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // const Divider(
            //   thickness: 8,
            //   color: Colors.black54,
            // ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: startAnimation,
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(8.0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: isordered
                    ? const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Ordered Successfully'),
                      )
                    : iscompleted
                        ? const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text('Ordered Successfully'),
                          )
                        : const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text('Place Order'),
                          )),
          ],
        ),
      ),
    );
  }
}
