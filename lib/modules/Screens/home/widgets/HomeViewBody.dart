// ignore_for_file: file_names

import 'package:first_app/modules/Screens/home/Products/BuyProduct.dart';
import 'package:first_app/modules/Screens/home/Products/Fcarousel_slider.dart';
import 'package:first_app/modules/Screens/home/Products/ShowAllProduct.dart';
import 'package:first_app/modules/Screens/home/Products/Pcarousel_slider.dart';
import 'package:first_app/modules/Screens/home/Products/cubit/product_cubit.dart';
import 'package:first_app/modules/Screens/home/Products/cubit/product_state.dart';
import 'package:first_app/modules/Screens/home/bannars/cubit/bannars_cubit.dart';
import 'package:first_app/modules/Screens/home/bannars/cubit/bannars_state.dart';
import 'package:first_app/modules/Screens/home/bannars/carousel_slider.dart';
import 'package:first_app/modules/Screens/home/bannars/dotIndicator.dart';
import 'package:first_app/modules/Screens/home/widgets/CustomRoww.dart';
import 'package:first_app/modules/Screens/home/widgets/flashdeal.dart';
import 'package:first_app/modules/Screens/home/widgets/gridViewProduct.dart';
import 'package:first_app/modules/Screens/search/searchView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const SearchView(),
          const BCarouselSlider(),
          BlocConsumer<BannarsCubit, BannarsState>(
            builder: (context, state) {
              return DotIndicator(
                index: context.read<BannarsCubit>().currentIndex,
              );
            },
            listener: (BuildContext context, BannarsState state) {},
          ),
          const CategoryView(),
          const SizedBox(
            height: 15,
          ),
          const PCarouselSlider(),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
                'assets/image2/m037t0020_b_black_friday_flyer_10july023.jpg'),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomRoww(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShowAllProduct(),
                  ));
            },
            tx1: 'All Products',
            tx2: 'View All',
          ),
          const SizedBox(
            height: 20,
          ),
          const GridViewProduct(),
          const SizedBox(
            height: 20,
          ),
          CustomRoww(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShowAllProduct(),
                  ));
            },
            tx1: 'Featuer Deals',
            tx2: 'View All',
          ),
          const SizedBox(
            height: 20,
          ),
          const FCarouselSlider(),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/image2/wPeBVvsGCzx2ALrBXMmwkR.jpg'),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Sales',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 6, 38, 94)),
          ),
          const Text(
            'Lets Shoping Today',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
                color: Color.fromARGB(255, 6, 38, 94)),
          ),
          BlocProvider(
            create: (context) => ProductCubit()..getProducts(),
            child: BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                final cubit = context.read<ProductCubit>();
                return cubit.products.isEmpty
                    ? const CircularProgressIndicator()
                    : ProductWidget(
                        productID: cubit.products.first.id.toString(),
                        des: cubit.products.first.description!,
                        discountedPrice: cubit.products.first.oldPrice!,
                        imageUrl: cubit.products.first.image!,
                        originalPrice: cubit.products.first.price!,
                        productName: cubit.products.first.name!,
                      );
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
