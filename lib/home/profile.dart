import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  final ImagePicker _picker = ImagePicker();
  @override
        void takePhoto(ImageSource source) async {
  final pickedFile = await _picker.pickImage(
    source: source,
  );
}
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}