// ignore_for_file: file_names

import 'package:first_app/modules/Screens/cart/widgets/CartViewBody.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CartViewBody(),
    );
  }
}
