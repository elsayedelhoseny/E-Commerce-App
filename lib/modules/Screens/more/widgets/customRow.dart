// ignore_for_file: file_names

import 'package:first_app/shared/style/colors.dart';
import 'package:flutter/material.dart';

class CRow extends StatelessWidget {
  const CRow({super.key, required this.icon, required this.txt, this.onTap});
  final IconData icon;
  final String txt;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: mainColor,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              txt,
              style: const TextStyle(fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}
