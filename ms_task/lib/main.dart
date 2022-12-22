import 'package:flutter/material.dart';
import 'package:ms_task/Screens/splash_screen.dart';

void main() {
  runApp(const MSTask());
}
class MSTask extends StatefulWidget {
  const MSTask({super.key});

  @override
  State<MSTask> createState() => _MSTaskState();
}

class _MSTaskState extends State<MSTask> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}