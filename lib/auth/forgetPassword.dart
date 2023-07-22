import 'package:flutter/material.dart';
import 'package:DouxRes/auth/verificationPage.dart';
import 'package:DouxRes/theme/color.dart';
import 'package:DouxRes/theme/auth_templets.dart';
import '../service/auth_service.dart';
import 'log_in.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
                'Forgot password ?',
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
            CustomTextField(
                controller: nameController,
                text: 'Name',
                hintText: 'Enter your name'),
            CustomTextField(
                controller: phoneController,
                text: 'Phone number',
                hintText: 'Enter your phone number'),
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
                      if (nameController.text.isEmpty ||
                          phoneController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please fill in all fields")),
                        );
                        return;
                      }

                      var status = await forgetPassword(
                          nameController.text, phoneController.text);
                      if (status[0] == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => verificationPage(
                                    nameController: nameController,
                                    phoneController: phoneController,
                                  )),
                        );
                        ScaffoldMessenger.of(context)
                            .showSnackBar(new SnackBar(content: Text("hi")));
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const HomePage()),
                        // );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            new SnackBar(content: Text("$status")));
                      }
                    },
                    child: Text('Next'),
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
