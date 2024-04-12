// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_app/modules/Screens/home/Products/ProductView2.dart';
import 'package:first_app/modules/Screens/home/Products/cubit/product_cubit.dart';
import 'package:first_app/modules/Screens/home/Products/cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FCarouselSlider extends StatelessWidget {
  const FCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getProducts(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<ProductCubit>();
          return CarouselSlider.builder(
            itemCount: cubit.products.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    ProuctView2(
              productID: cubit.products[itemIndex].id.toString(),
              imageUrl: cubit.products[itemIndex].image!,
              description: cubit.products[itemIndex].description!,
              discountPrice: cubit.products[itemIndex].oldPrice!,
              originalPrice: cubit.products[itemIndex].price!,
              title: cubit.products[itemIndex].name!,
            ),
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height / 4.8,
              aspectRatio: 16 / 8,
              viewportFraction: .9,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (index, reason) {},
              scrollDirection: Axis.horizontal,
            ),
          );
        },
      ),
    );
  }
}
