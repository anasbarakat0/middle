import 'package:flutter/material.dart';
import 'package:front/home/home_page.dart';
import '../main.dart';
import '../service/profile_service.dart';
import '../theme/color.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = userName;
    phoneController.text = phone;
    addressController.text = address;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Your Profile'),
        backgroundColor: AppColors.red,
        foregroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 100,
                ),
                child: Text(
                  'Welcome $userName',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  bottom: 80,
                ),
                child: Text(
                  'Edit Your Profile Details...',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              const Stack(),
              //name textfield
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: AppColors.grey,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red),
                  ),
                ),
                cursorColor: AppColors.red,
              ),
              //phone textfield
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  labelStyle: TextStyle(
                    color: AppColors.grey,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red),
                  ),
                ),
                cursorColor: AppColors.red,
              ),
              //address textfield
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  labelStyle: TextStyle(
                    color: AppColors.grey,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red),
                  ),
                ),
                cursorColor: AppColors.red,
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: AppButtons.myButtonStyle,
                  onPressed: () async {
                    var status = await changeProfileData(nameController.text,
                        phoneController.text, addressController.text);
                    if (status[0] == true) {

                      _scaffoldMessengerKey.currentState?.showSnackBar(
                        SnackBar(
                          content: Text("${status[1]}"),
                        ),
                      );
                      // ignore: use_build_context_synchronously
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                    } else {
                      _scaffoldMessengerKey.currentState?.showSnackBar(
                        const SnackBar(
                          content: Text("Connection refused"),
                        ),
                      );
                    }
                  },
                  child: const Text('Save Changes'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
