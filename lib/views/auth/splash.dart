import 'package:flutter/material.dart';
import 'package:ystop_mystop/views/auth/login.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  // User? user;
  late AnimationController _controller;

  bool myBool = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.stop();
      }
    });

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginView2()),
      );
      // navigateToNextScreen();
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        myBool = !myBool;
        print(myBool);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: myBool ? Colors.orange : Colors.white,
          child: Center(
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1.0, 0.0), // Slide in from the left
                end: const Offset(0.0, 0.0), // Stop at the center
              ).animate(_controller),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myBool
                      ? Image(
                          image: AssetImage(
                            'assets/images/logo2.png',
                          ),
                          height: 200,
                          width: 200,
                        )
                      : Image(
                          image: AssetImage(
                            'assets/images/logo.jpg',
                          ),
                          height: 200,
                          width: 200,
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
