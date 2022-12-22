
import 'package:flutter/material.dart';
import 'package:ms_task/Screens/home.dart';
import 'package:ms_task/Theme/theme_settings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: customTheme(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              "images/logo.png",
              width: 100,
            )),
            const SizedBox(
              height: 30,
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Email",
                          fillColor: Color(0xfff4f4f4),
                          filled: true,
                          border: InputBorder.none),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                          
                          suffixIcon: IconButton(
                            icon: _obscureText
                                ? const Icon(Icons.visibility_rounded, color: Colors.grey,)
                                : const Icon(Icons.visibility_off_rounded, color: Colors.grey),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          hintText: "Password",
                          fillColor: const Color(0xfff4f4f4),
                          filled: true,
                          border: InputBorder.none),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder:(context) => const HomeScreen(),)),
                child: Container(
                  
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xffE33227),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 0.5,
                        blurRadius: 5,
                        offset: Offset(5, 5)
                      )
                    ]  
                  ),
                  width: double.infinity,
                  child: const Center(child: Text("LOGIN", style: TextStyle(color: Colors.white, fontSize: 15),)) ,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
