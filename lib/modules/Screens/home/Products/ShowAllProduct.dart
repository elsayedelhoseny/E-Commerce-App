import 'package:first_app/models/product_model.dart';
import 'package:first_app/modules/Screens/home/Products/cubit/product_cubit.dart';
import 'package:first_app/modules/Screens/home/Products/cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowAllProduct extends StatelessWidget {
  const ShowAllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProductCubit()..getProducts(),
        child: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = context.read<ProductCubit>();
            return cubit.products.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: cubit.products.length,
                    itemBuilder: (context, index) {
                      return _productItem(model: cubit.products[index]);
                    },
                  );
          },
        ),
      ),
    );
  }
}

Widget _productItem({required ProductModel model}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
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
            child: Image.network(
              model.image!,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
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
                style: TextStyle(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 28, 121, 197),
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    ),
  );
}
