// ignore_for_file: file_names

import 'package:first_app/modules/Screens/home/Products/cubit/product_cubit.dart';
import 'package:first_app/modules/Screens/home/Products/cubit/product_state.dart';
import 'package:first_app/modules/Widgets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
              leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )),
            ),
            backgroundColor: const Color.fromARGB(255, 228, 226, 226),
            body: BlocProvider(
                create: (context) => ProductCubit()..getCategoriesData(),
                child: BlocConsumer<ProductCubit, ProductState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    final cubit = context.read<ProductCubit>();
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      child: cubit.categories.isEmpty
                          ? const Center(child: CircularProgressIndicator())
                          : GridView.builder(
                              itemCount: cubit.categories.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 15),
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 4),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Image.network(
                                          cubit.categories[index].url!,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(cubit.categories[index].title!)
                                    ],
                                  ),
                                );
                              }),
                    );
                  },
                ))));
  }
}
