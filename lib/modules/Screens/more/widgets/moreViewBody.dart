// ignore_for_file: file_names

import 'package:first_app/modules/Screens/more/widgets/customContainer.dart';
import 'package:first_app/modules/Screens/more/widgets/ScrollView.dart';
import 'package:first_app/modules/Screens/more/widgets/General.dart';
import 'package:first_app/modules/Screens/more/widgets/customRow.dart';
import 'package:first_app/modules/Screens/more/widgets/help_supportView.dart';
import 'package:first_app/shared/style/colors.dart';
import 'package:flutter/material.dart';

class MoreViewBody extends StatelessWidget {
  const MoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 45,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'name',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Spacer(),
                  Icon(
                    Icons.dark_mode_rounded,
                    color: Colors.white,
                    size: 40,
                  )
                ],
              ),
            )),
        Expanded(
          flex: 4,
          child: Container(
            width: double.infinity,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 228, 226, 226)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CScrollView(),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'General',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    General(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Help & Support',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Help_SupportView(),
                    SizedBox(
                      height: 20,
                    ),
                    CRow(
                      icon: Icons.logout,
                      txt: 'Logout',
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
