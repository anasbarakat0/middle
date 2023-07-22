import 'package:flutter/material.dart';
import 'auth/log_in.dart';
import 'theme/color.dart';
import 'home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAuthenticated = false;
    return MaterialApp(
      title: 'DouxRes',
      theme: ThemeData(
        fontFamily: 'Cairo',
        primaryColor: AppColors.red,
      ),
      debugShowCheckedModeBanner: false,
      // routerDelegate: const StartPage(),
      home: isAuthenticated? StartPage():HomePage(),
    );
  }
}
