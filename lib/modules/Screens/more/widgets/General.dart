// ignore_for_file: file_names

import 'package:first_app/modules/Screens/more/widgets/profileView.dart';

import 'customRow.dart';
import 'package:flutter/material.dart';

class General extends StatelessWidget {
  const General({super.key});

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CRow(
            icon: Icons.location_city,
            txt: 'Track Order',
          ),
          CRow(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ));
            },
            icon: Icons.account_circle,
            txt: 'Profile',
          ),
          const CRow(
            icon: Icons.list,
            txt: 'Coupons',
          ),
          const CRow(
            icon: Icons.category,
            txt: 'Category',
          ),
          const CRow(
            icon: Icons.notifications,
            txt: 'Notification',
          ),
          const CRow(
            icon: Icons.settings,
            txt: 'Settings',
          ),
        ],
      ),
    );
  }
}
