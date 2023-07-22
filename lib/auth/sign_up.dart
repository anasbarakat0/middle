import 'package:DouxRes/service/auth_service.dart';
import 'package:flutter/material.dart';
import '../theme/color.dart';
import 'package:DouxRes/theme/auth_templets.dart';

import 'log_in.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController phoneNumController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController conPasswordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isCPasswordVisible = false;
  bool match = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          alignment: Alignment.topLeft,
          child: ListView(
            padding: EdgeInsets.all(7),
            shrinkWrap: false,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StartPage()),
                    );
                  },
                  icon: const Icon(Icons.keyboard_backspace_sharp),
                ),
              ),
              Container(
                height: 80,
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Do you want to join us ?',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 80,
                alignment: Alignment.topLeft,
                child: Text(
                  "So, welcome... Register here",
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomTextField(
                    controller: _nameController,
                    text: 'Name',
                    hintText: 'Enter your name',
                  ),
                  CustomTextField(
                    controller: phoneNumController,
                    text: 'Phone Number',
                    hintText: 'Enter your phone number',
                  ),
                  CustomTextField(
                    controller: addressController,
                    text: 'Address',
                    hintText: 'Enter your address',
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Password',
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
                              hintText: 'Create Password',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.red, width: 1.0),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
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
                            controller: conPasswordController,
                            decoration: InputDecoration(
                              hintText: 'Confirm your Password',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.red, width: 1.0),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: match
                                  ? const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.green, width: 1.0),
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
                 
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: SizedBox(
                      width: 120.0,
                      height: 45,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(AppColors.red),
                        ),
                        onPressed: () async {
                          if (_nameController.text.isEmpty || phoneNumController.text.isEmpty ||addressController.text.isEmpty ||passwordController.text.isEmpty ||conPasswordController.text.isEmpty){
                            ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please fill in all fields")),
                        );
                        return;
                          }


                          if (passwordController.text ==
                              conPasswordController.text) {
                            var status = await signup(
                                _nameController.text,
                                passwordController.text,
                                phoneNumController.text,
                                addressController.text);

                            if (status[0] == true) {
                              Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const StartPage()),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                  new SnackBar(
                                      content: Text("${status[1]}")));
                              
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  new SnackBar(content: Text("$status")));
                            }
                          }
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
