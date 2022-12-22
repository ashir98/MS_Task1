import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ms_task/Screens/login.dart';

class SplashService{
  void isLogin(BuildContext context){
    Timer(const Duration(seconds: 3), (){
      Navigator.push(context, MaterialPageRoute(builder:(context) => const LoginScreen(),));
    });
  }
}