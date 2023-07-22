import 'package:flutter/material.dart';
import 'package:DouxRes/service/auth_service.dart';

import '../theme/auth_templets.dart';
import '../theme/color.dart';
import 'changePassword.dart';
import 'forgetPassword.dart';


class verificationPage extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  const verificationPage(
      {super.key, required this.nameController, required this.phoneController});

  @override
  State<verificationPage> createState() => _verificationPageState();
}

class _verificationPageState extends State<verificationPage> {
  final TextEditingController digit1 = TextEditingController();
  final TextEditingController digit2 = TextEditingController();
  final TextEditingController digit3 = TextEditingController();
  final TextEditingController digit4 = TextEditingController();

  bool areAllDigitsFilled() {
    return digit1.text.isNotEmpty &&
        digit2.text.isNotEmpty &&
        digit3.text.isNotEmpty &&
        digit4.text.isNotEmpty;
  }

  int getCode() {
    // int code = int.parse((digit1.text*1000) + (digit2.text*100) + (digit3.text*10) + digit4.text);
    int code = int.parse(digit1.text + digit2.text + digit3.text + digit4.text);
    return code;
  }

  @override
  void initState() {
    super.initState();
    digit1.addListener(updateButtonState);
    digit2.addListener(updateButtonState);
    digit3.addListener(updateButtonState);
    digit4.addListener(updateButtonState);
  }

  @override
  void dispose() {
    digit1.removeListener(updateButtonState);
    digit2.removeListener(updateButtonState);
    digit3.removeListener(updateButtonState);
    digit4.removeListener(updateButtonState);
    super.dispose();
  }

  void updateButtonState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => ForgetPasswordPage()),
                );
              },
              icon: const Icon(Icons.keyboard_backspace_sharp),
            ),
          ),
          Container(
            height: 200,
            alignment: Alignment.center,
            child: const Text(
              'Verification Page',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              "Please Enter your verification code",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DigitBox(controller: digit1),
                DigitBox(controller: digit2),
                DigitBox(controller: digit3),
                DigitBox(controller: digit4),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: areAllDigitsFilled()
                    ? ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(AppColors.red),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      )
                    : ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.redLight),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                onPressed: areAllDigitsFilled()
                    ? () async {
                        var status = await changePassword(widget.phoneController.text,
                            getCode(), widget.nameController.text);
                            if (status[0] == true){
                              Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => changePasswordPage(
                                nameController: widget.nameController,
                                    phoneController: widget.phoneController, code: getCode(),
                              )),
                        );
                            }
                            else{
                               ScaffoldMessenger.of(context).showSnackBar(
                            new SnackBar(content: Text("$status")));
                            }
                      }
                    : null,
                child: Text(
                  areAllDigitsFilled() ? "Change Password" : "Enter the code",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
