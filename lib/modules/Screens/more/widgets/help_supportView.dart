// ignore_for_file: camel_case_types, file_names

import 'package:first_app/modules/Screens/more/widgets/customRow.dart';
import 'package:flutter/material.dart';

class Help_SupportView extends StatelessWidget {
  const Help_SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CRow(
            icon: Icons.chat,
            txt: 'Inbox',
          ),
          CRow(
            icon: Icons.phone,
            txt: 'Contact Us',
          ),
          CRow(
            icon: Icons.support_agent,
            txt: 'Support Tickets',
          ),
          CRow(
            icon: Icons.article,
            txt: 'Teams & Condiction',
          ),
          CRow(
            icon: Icons.verified_user,
            txt: 'Privacy Policy',
          ),
          CRow(
            icon: Icons.article,
            txt: 'Refund Policy',
          ),
          CRow(
            icon: Icons.article,
            txt: 'Return Policy',
          ),
          CRow(
            icon: Icons.article,
            txt: 'Cancellation Policy',
          ),
          CRow(
            icon: Icons.quiz,
            txt: 'FAQ',
          ),
          CRow(
            icon: Icons.person,
            txt: 'About Us',
          ),
        ],
      ),
    );
  }
}
