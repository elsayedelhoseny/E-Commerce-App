// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.controller,
      this.prefixIcon,
      this.color,
      this.bordercolor,
      this.backgroundcolor,
      this.obscureText = false,
      this.onChanged,
      this.prefixIconColor,
      this.labelText,
      this.hintText});
  Function(String)? onChanged;
  String? hintText;
  Widget? prefixIcon;
  bool? obscureText;
  Color? color;
  Color? bordercolor;
  Color? backgroundcolor;
  Color? prefixIconColor;
  String? labelText;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 368,
      decoration: BoxDecoration(
          color: backgroundcolor, borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText!,
        validator: (data) {
          if (data!.isEmpty) {
            return 'value is wrong';
          }
          return null;
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor,
          labelText: labelText,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 10, color: color),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: bordercolor!,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: bordercolor!,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: bordercolor!,
            ),
          ),
        ),
      ),
    );
  }
}
