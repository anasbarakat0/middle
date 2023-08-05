import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth/app/injection/get_it_inject.dart';
import 'auth/log_in.dart';
import 'home/home_page.dart';
import 'theme/color.dart';

const url = 'https://dcc9-145-249-64-188.ngrok-free.app';
// const url = 'http://192.168.1.115:3000';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

bool isAuthenticated =
    getIt.get<SharedPreferences>().getBool('isAuthenticated') ?? false;
String userId= '';
String userName = '';
String phone = '';
String address = '';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DouxRes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.red),
        fontFamily: 'Cairo',
        primaryColor: AppColors.red,
      ),
      debugShowCheckedModeBanner: true,
      home: isAuthenticated ? const HomePage() : const StartPage(),
      
    );
  }
}
