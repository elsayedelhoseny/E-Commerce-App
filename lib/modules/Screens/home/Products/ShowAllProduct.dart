// ignore_for_file: file_names

import 'package:first_app/modules/Screens/home/Products/BuyProduct.dart';
import 'package:first_app/modules/Screens/home/Products/cubit/product_cubit.dart';
import 'package:first_app/modules/Screens/home/Products/cubit/product_state.dart';
import 'package:first_app/modules/Widgets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowAllProduct extends StatelessWidget {
  const ShowAllProduct({super.key});

  @override
  Widget build(BuildContext context) {
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
        create: (context) => ProductCubit()..getProducts(),
        child: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = context.read<ProductCubit>();
            return cubit.products.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: cubit.products.length,
                    itemBuilder: (context, index) {
                      return ProductWidget(
                        productID: cubit.products[index].id.toString(),
                        des: cubit.products[index].description!,
                        discountedPrice: cubit.products[index].oldPrice!,
                        imageUrl: cubit.products[index].image!,
                        originalPrice: cubit.products[index].price!,
                        productName: cubit.products[index].name!,
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
