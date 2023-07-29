import 'package:flutter/material.dart';
import 'package:front/auth/sign_up.dart';
import '../main.dart';
import '../theme/color.dart';
import '../service/auth_service.dart';
import '../auth/forgetPassword.dart';
import '../home/home_page.dart';

TextEditingController name = TextEditingController();
TextEditingController password = TextEditingController();

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool isPasswordVisible = false;
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  void _signInButtonPressed() async {
    var status = await login(name.text, password.text);

    if (status == true) {
      print('status: $status');
      isAuthenticated = true;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else if (status != true) {
      _scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("$status"),
        ),
      );
    } else {
      _scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Connection refused"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Transform.translate(
              offset: Offset(-MediaQuery.of(context).size.width / 3, 0),
              child: Transform.rotate(
                angle: -45 * 0.0174533,
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.width / 1.5,
                  color: AppColors.red,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 200,
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 90,
                          height: 5,
                          color: AppColors.red,
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.redLight,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: name,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(
                              color: AppColors.grey,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.red),
                            ),
                          ),
                          style: AppFont.textFieldStyle,
                          cursorColor: AppColors.red,
                        ),
                        TextField(
                          controller: password,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: AppColors.grey,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: AppColors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.red),
                            ),
                          ),
                          obscureText: !isPasswordVisible,
                          style: AppFont.textFieldStyle,
                          cursorColor: AppColors.red,
                          onSubmitted: (_) {
                            _signInButtonPressed();
                          },
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ForgetPasswordPage(),
                                    ),
                                  );
                                },
                                child: Text('Forgot password?',
                                    style: AppFont.cairoS),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignUpPage(),
                                    ),
                                  );
                                },
                                child: Text('Create account',
                                    style: AppFont.cairoS),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: SizedBox(
                            width: 130,
                            child: ElevatedButton(
                              onPressed: _signInButtonPressed,
                              style: AppButtons.myButtonStyle,
                              child: const Text(
                                'Log in',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
