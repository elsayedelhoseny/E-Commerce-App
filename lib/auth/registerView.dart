// ignore_for_file: file_names

import 'package:first_app/core/widgets/CustomButton.dart';
import 'package:first_app/core/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Text(
              'Register',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
            hintText: 'Name *',
            bordercolor: Colors.black,
          ),
          const SizedBox(
            height: 20,
          ),
          const IntlPhoneField(
            decoration: InputDecoration(
                hintText: 'Phone *',
                border: OutlineInputBorder(borderSide: BorderSide())),
            keyboardType: TextInputType.phone,
            initialCountryCode: 'EG',
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
            text: 'Register',
            colortxt: Colors.white,
            color: Colors.blue,
            colorborder: Color.fromARGB(255, 5, 64, 112),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
