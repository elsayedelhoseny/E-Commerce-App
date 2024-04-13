// ignore_for_file: file_names

import 'package:first_app/modules/Screens/more/widgets/customContainer.dart';
import 'package:flutter/material.dart';

class CScrollView extends StatelessWidget {
  const CScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CustomContainer(
            icon: Icons.local_fire_department,
            txt: 'Offers',
          ),
          CustomContainer(
            icon: Icons.shopping_cart,
            txt: 'Cart',
          ),
          CustomContainer(
            icon: Icons.favorite_outline,
            txt: 'Wishlist',
          ),
        ],
      ),
    );
  }
}
