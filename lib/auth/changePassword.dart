import 'package:flutter/material.dart';
import 'package:front/theme/color.dart';
import '../home/home_page.dart';
import '../service/auth_service.dart';
import 'log_in.dart';

class changePasswordPage extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final int code;
  const changePasswordPage(
      {super.key,
      required this.nameController,
      required this.phoneController,
      required this.code});
  @override
  _changePasswordPageState createState() => _changePasswordPageState();
}

class _changePasswordPageState extends State<changePasswordPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isCPasswordVisible = false;
  bool match = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(23.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => const StartPage()),
                  );
                },
                icon: const Icon(Icons.keyboard_backspace_sharp),
              ),
            ),
            Container(
              height: 80,
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Change Your Password',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 80,
              alignment: Alignment.topLeft,
              child: Text(
                "Don't worry about your account",
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'New Password',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2.0,
                          blurRadius: 3.0,
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(3, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          if (value == passwordController.text) {
                            match = true;
                          } else {
                            match = false;
                          }
                        });
                      },
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Create New Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.red, width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.red, width: 1.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.all(16.0),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 40.0,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      cursorColor: AppColors.red,
                      obscureText: !isPasswordVisible,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Confirm Password',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2.0,
                          blurRadius: 3.0,
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(3, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          if (value == passwordController.text) {
                            match = true;
                          } else {
                            match = false;
                          }
                        });
                      },
                      controller: cPasswordController,
                      decoration: InputDecoration(
                        hintText: 'Confirm your Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.red, width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: match
                            ? const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.green, width: 1.0),
                              )
                            : OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.red, width: 1.0),
                              ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.all(16.0),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 40.0,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isCPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              isCPasswordVisible = !isCPasswordVisible;
                            });
                          },
                        ),
                      ),
                      cursorColor: AppColors.red,
                      obscureText: !isCPasswordVisible,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: SizedBox(
                  width: 70.0,
                  height: 35,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.red),
                    ),
                    onPressed: () async {
                      if (passwordController.text.isEmpty ||
                          cPasswordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please fill in all fields")),
                        );
                        return;
                      } else if (match != true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("Please reconfirm your password")),
                        );
                        return;
                      } else {
                        var status = await changePassword(
                            widget.phoneController.text,
                            widget.code,
                            passwordController.text);
                        if (status[0] == true) {
                          print('status: ${status[1]}');
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("pleas try again")),
                          );
                        }
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// () async {
//                             if (passwordController.text ==
//                                 conPasswordController.text) {
//                               var status = await signup(
//                                   _nameController.text,
//                                   passwordController.text,
//                                   phoneNumController.text,
//                                   addressController.text);
              
//                               if (status[0] == true) {
//                                 Navigator.pop(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => const StartPage()),
//                                 );
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                     new SnackBar(
//                                         content: Text("${status[1]}")));
//                                 // Navigator.pushReplacement(
//                                 //   context,
//                                 //   MaterialPageRoute(
//                                 //       builder: (context) => const HomePage()),
//                                 // );
//                               } else {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                     new SnackBar(content: Text("$status")));
//                               }
//                             }
//                           },