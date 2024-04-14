// ignore_for_file: file_names

import 'package:first_app/models/product_model.dart';
import 'package:first_app/modules/Screens/home/Products/cubit/product_cubit.dart';
import 'package:first_app/modules/Screens/home/Products/cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridViewProduct extends StatelessWidget {
  const GridViewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getProducts(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<ProductCubit>();
          return cubit.products.isEmpty
              ? const CircularProgressIndicator()
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 9,
                      childAspectRatio: .61,
                      crossAxisSpacing: 0),
                  itemBuilder: (context, index) {
                    return _productItem(
                        model: cubit.products[index], cubit: cubit);
                  },
                );
        },
      ),
    );
  }
}

Widget _productItem(
    {required ProductModel model, required ProductCubit cubit}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                Image.network(
                  model.image!,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        cubit.addOrRemoveFromFavorites(
                            productID: model.id.toString());
                      },
                      child: Icon(
                        Icons.favorite,
                        color: cubit.favoritesID.contains(model.id.toString())
                            ? Colors.red
                            : Colors.grey,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            model.name!,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            model.description!,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(
            height: 5,
          ),
          FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "\$ ${model.price!} ",
                style: const TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 28, 121, 197),
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    ),
  );
}
