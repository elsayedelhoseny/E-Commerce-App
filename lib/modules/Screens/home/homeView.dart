// ignore_for_file: file_names

import 'package:first_app/modules/Screens/home/widgets/HomeViewBody.dart';
import 'package:first_app/modules/Widgets/assets.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 6, 38, 94),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetData.logo,
                height: 65,
              ),
              const Text(
                'Azzrk',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 228, 226, 226),
        body: const HomeViewBody(),
      ),
    );
  }
}
