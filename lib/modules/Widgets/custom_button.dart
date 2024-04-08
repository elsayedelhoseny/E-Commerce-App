import 'package:flutter/material.dart';

class CustomButon extends StatelessWidget {
  const CustomButon(
      {super.key,
      this.onTap,
      required this.text,
      this.color,
      this.colortxt,
      this.colorborder});
  final VoidCallback? onTap;
  final String text;
  final Color? color;
  final Color? colortxt;
  final Color? colorborder;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: colorborder!)),
        width: double.infinity,
        height: 50,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: colortxt, fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
