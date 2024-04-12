// ignore_for_file: file_names

import 'package:first_app/modules/Screens/cart/cubit/cart_cubit.dart';
import 'package:first_app/modules/Screens/home/Products/cubit/product_cubit.dart';
import 'package:first_app/modules/Screens/home/Products/cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget(
      {super.key,
      required this.imageUrl,
      required this.productName,
      required this.originalPrice,
      required this.discountedPrice,
      required this.des,
      required this.productID});
  final String imageUrl;
  final String productName;
  final String des;
  final int originalPrice;
  final int discountedPrice;
  final String productID;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit()..getProducts(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
      ],
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<ProductCubit>();
          final ccubit = context.read<CartCubit>();
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.network(
                    imageUrl,
                    width: 150,
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  productName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  cubit.addOrRemoveFromFavorites(
                                      productID: productID);
                                },
                                child: Icon(
                                  Icons.favorite,
                                  color: cubit.favoritesID.contains(productID)
                                      ? Colors.red
                                      : Colors.grey,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),

                          // Additional text
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              des,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),

                          // Price row
                          Row(
                            children: [
                              Text(
                                '\$$originalPrice',
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '\$$discountedPrice',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 20, 101, 167),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),

                          // Buy Now Button
                          const SizedBox(height: 10),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        ccubit.cartID.contains(productID)
                                            ? Colors.red
                                            : const Color.fromARGB(
                                                255, 6, 38, 94))),
                            onPressed: () {
                              ccubit.addOrRemoveFromCart(productID: productID);
                            },
                            child: const Text(
                              'Buy Now',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
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
