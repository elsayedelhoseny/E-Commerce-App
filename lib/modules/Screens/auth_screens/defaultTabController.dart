// ignore_for_file: file_names, camel_case_types

import 'package:first_app/modules/Widgets/assets.dart';
import 'package:flutter/material.dart';
import 'loginView.dart';
import 'registerView.dart';

class defaultTabController extends StatelessWidget {
  const defaultTabController({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.blue),
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  AssetData.logo,
                  height: 170,
                  width: 200,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: const Column(
                    children: [
                      TabBar(
                        tabs: [
                          Tab(text: 'Sign in'),
                          Tab(text: 'Sign up'),
                        ],
                        labelColor: Colors.blue,
                        indicatorColor: Colors.blue,
                        unselectedLabelColor: Colors.black,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            LoginScreen(),
                            RegisterScreen(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
