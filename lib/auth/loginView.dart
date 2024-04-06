// ignore_for_file: file_names

import 'package:first_app/core/widgets/CustomButton.dart';
import 'package:first_app/core/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Text(
              'Login',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          CustomTextField(
            hintText: 'Email *',
            bordercolor: Colors.black,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            hintText: 'Password *',
            bordercolor: Colors.black,
          ),
          const SizedBox(
            height: 30,
          ),
          const CustomButon(
            text: 'Login',
            colortxt: Colors.white,
            color: Colors.blue,
            colorborder: Color.fromARGB(255, 5, 64, 112),
          )
        ],
      ),
    );
  }
}
