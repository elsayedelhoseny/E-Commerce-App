// ignore_for_file: sort_child_properties_last, file_names

import 'package:first_app/modules/Screens/home/Products/cubit/product_cubit.dart';
import 'package:first_app/modules/Screens/home/Products/cubit/product_state.dart';
import 'package:first_app/modules/Screens/search/searchView.dart';
import 'package:first_app/modules/Widgets/assets.dart';
import 'package:first_app/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavViewBody extends StatelessWidget {
  const FavViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProductCubit>(context);
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 6, 38, 94),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetData.logo,
                    height: 65,
                  ),
                  const Text(
                    'Azzrk',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 228, 226, 226),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 12.5),
              child: Column(
                children: [
                  const SearchView(),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: cubit.favorites.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 12.5),
                            child: Row(
                              children: [
                                Image.network(
                                  cubit.favorites[index].image!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        cubit.favorites[index].name!,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            fontSize: 16.5,
                                            fontWeight: FontWeight.bold,
                                            color: mainColor,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "${cubit.favorites[index].price!} \$"),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "${cubit.favorites[index].oldPrice!} \$",
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          cubit.addOrRemoveFromFavorites(
                                              productID: cubit
                                                  .favorites[index].id
                                                  .toString());
                                        },
                                        child: const Text("Remove"),
                                        textColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        color: mainColor,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            ));
      },
    );
  }
}
