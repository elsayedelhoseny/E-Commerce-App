import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.suffixIcon,
      this.labelStyle,
      this.controller,
      this.labelText,
      this.prefixIcon,
      this.color,
      this.bordercolor,
      this.backgroundcolor,
      this.obscureText = false,
      this.onChanged,
      this.hintText});
  Function(String)? onChanged;
  String? hintText;
  TextEditingController? controller;
  Widget? prefixIcon;
  bool? obscureText;
  Color? color;
  Color? bordercolor;
  Color? backgroundcolor;
  String? labelText;
  Widget? suffixIcon;
  TextStyle? labelStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
          color: backgroundcolor, borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        obscureText: obscureText!,
        validator: (data) {
          if (data!.isEmpty) {
            return 'value is wrong';
          }
          return null;
        },
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          prefixIconColor: Colors.black,
          hintText: hintText,
          labelText: labelText,
          labelStyle: labelStyle,
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
