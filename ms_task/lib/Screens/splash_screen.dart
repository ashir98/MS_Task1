import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:ms_task/Services/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  // late final AnimationController _animationController = AnimationController(vsync: this)..addListener(() { });

  SplashService splashService = SplashService();
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    splashService.isLogin(context);
    setState(() {
      
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 10, end: 150),
                duration: const Duration(seconds: 1), 
                curve: Curves.linear,
                builder: (context, value, child) {
                  return Image.asset("images/logo.png",width: value,);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}