// ignore_for_file: file_names

import 'package:first_app/shared/style/colors.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key, required this.icon, required this.txt, this.onTap});
  final IconData icon;
  final String txt;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: mainColor),
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              txt,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
