// ignore_for_file: file_names

import 'package:first_app/modules/Screens/home/Products/cubit/product_cubit.dart';
import 'package:first_app/modules/Screens/home/Products/cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  // Example data for the product card
  final String imageUrl;
  final String productName;
  final int originalPrice;
  final int discountPrice;
  final String productID;
  const ProductCard(
      {super.key,
      required this.imageUrl,
      required this.productName,
      required this.originalPrice,
      required this.discountPrice,
      required this.productID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getProducts(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<ProductCubit>();
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        // width: halfScreenWidth,
                        child: Image.network(
                          imageUrl,
                          height: 280,
                          width: double.infinity,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () {
                            cubit.addOrRemoveFromFavorites(
                                productID: productID);
                          },
                          child: Icon(
                            Icons.favorite,
                            color: cubit.favoritesID.contains(productID)
                                ? Colors.red
                                : Colors.grey,
                            size: 40,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 6, 38, 94),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.zero,
                                topLeft: Radius.zero),
                          ),
                          child: const Text(
                            '10% OFF',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 14),
                    child: Text(
                      productName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$$originalPrice',
                        style: const TextStyle(
                          fontSize: 20,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        '\$$discountPrice',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 28, 112, 180),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
