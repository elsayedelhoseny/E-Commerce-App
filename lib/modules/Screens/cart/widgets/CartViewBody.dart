// ignore_for_file: file_names

import 'package:first_app/modules/Screens/cart/cubit/cart_cubit.dart';
import 'package:first_app/modules/Screens/cart/cubit/cart_state.dart';
import 'package:first_app/modules/Screens/home/Products/cubit/product_cubit.dart';
import 'package:first_app/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final pcubit = BlocProvider.of<ProductCubit>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit()..getCarts(),
        ),
        BlocProvider(
          create: (context) => ProductCubit(),
        ),
      ],
      child: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = BlocProvider.of<CartCubit>(context);
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: Column(
                children: [
                  Expanded(
                      child: cubit.carts.isNotEmpty
                          ? ListView.separated(
                              itemCount: cubit.carts.length,
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 12,
                                );
                              },
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  child: Row(
                                    children: [
                                      Image.network(
                                        cubit.carts[index].image!,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.fill,
                                      ),
                                      const SizedBox(width: 12.5),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cubit.carts[index].name!,
                                              style: const TextStyle(
                                                  color: mainColor,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                    "${cubit.carts[index].price!} \$"),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                if (cubit.carts[index].price !=
                                                    cubit.carts[index].oldPrice)
                                                  Text(
                                                    "${cubit.carts[index].oldPrice!} \$",
                                                    style: const TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough),
                                                  ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                OutlinedButton(
                                                    onPressed: () {
                                                      pcubit
                                                          .addOrRemoveFromFavorites(
                                                              productID: cubit
                                                                  .carts[index]
                                                                  .id
                                                                  .toString());
                                                    },
                                                    child: Icon(
                                                      Icons.favorite,
                                                      color: pcubit.favoritesID
                                                              .contains(cubit
                                                                  .carts[index]
                                                                  .id
                                                                  .toString())
                                                          ? Colors.red
                                                          : Colors.grey,
                                                    )),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      cubit.addOrRemoveFromCart(
                                                          productID: cubit
                                                              .carts[index].id
                                                              .toString());
                                                    },
                                                    child: const Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                      size: 25,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              })
                          : const Center(
                              child: Text("There are no products "),
                            )),
                  Text(
                    "TotalPrice : ${cubit.totalPrice} \$",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: mainColor),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            );
          }),
    );
  }
}
