// ignore_for_file: file_names

import 'package:first_app/modules/Screens/more/widgets/moreViewBody.dart';
import 'package:first_app/shared/style/colors.dart';
import 'package:flutter/material.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: mainColor,
      body: MoreViewBody(),
    );
  }
}
