// ignore_for_file: file_names

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
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CRow(
            icon: Icons.location_city,
            txt: 'Track Order',
          ),
          CRow(
            icon: Icons.add_location,
            txt: 'Addresses',
          ),
          CRow(
            icon: Icons.list,
            txt: 'Coupons',
          ),
          CRow(
            icon: Icons.category,
            txt: 'Category',
          ),
          CRow(
            icon: Icons.notifications,
            txt: 'Notification',
          ),
          CRow(
            icon: Icons.settings,
            txt: 'Settings',
          ),
        ],
      ),
    );
  }
}
