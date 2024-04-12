// ignore_for_file: file_names

import 'package:first_app/modules/Screens/auth_screens/defaultTabController.dart';
import 'package:first_app/modules/Widgets/assets.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const defaultTabController()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  AssetData.logo,
                  height: 250,
                  width: 250,
                ),
              ),
            ),
            const Text(
              'Developed By ELsayed ELhoseny',
              style: TextStyle(color: Colors.black, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
