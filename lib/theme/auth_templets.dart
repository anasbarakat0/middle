import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'color.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscure;

  const CustomTextField({super.key, 
    required this.controller,
    required this.text,
    required this.hintText,
    this.suffixIcon,
    this.obscure = false,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.text,
            style: const TextStyle(
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
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: widget.hintText,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.red, width: 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.red, width: 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(16.0),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 40.0,
                ),
                suffixIcon: widget.suffixIcon,
              ),
              cursorColor: AppColors.red,
              obscureText: widget.obscure,
            ),
          ),
        ),
      ],
    );
  }
}

class DigitBox extends StatelessWidget {
  final TextEditingController controller;
  const DigitBox({super.key, 
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextField(
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.bottom,
          controller: controller,
          inputFormatters: [LengthLimitingTextInputFormatter(1)],
          decoration: InputDecoration(
            hintText: '*',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
            showCursor: false,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
