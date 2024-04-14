import 'package:flutter/material.dart';

class CustomRoww extends StatelessWidget {
  const CustomRoww(
      {super.key, required this.tx1, required this.tx2, required this.onTap});
  final String tx1;
  final String tx2;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tx1,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              tx2,
              style: const TextStyle(color: Colors.blue, fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
