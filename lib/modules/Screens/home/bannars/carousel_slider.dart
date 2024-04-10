import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_app/modules/Screens/home/bannars/cubit/bannars_cubit.dart';
import 'package:first_app/modules/Screens/home/bannars/cubit/bannars_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PCarouselSlider extends StatelessWidget {
  const PCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BannarsCubit()..getBannersData(),
      child: BlocConsumer<BannarsCubit, BannarsState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<BannarsCubit>();
          return Container(
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: CarouselSlider.builder(
              itemCount: cubit.banners.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Image.network(
                cubit.banners[itemIndex].url!,
                height: 150,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              options: CarouselOptions(
                height: 150,
                aspectRatio: 16 / 8,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) {
                  context.read<BannarsCubit>().changeCurrentIndex(index);
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          );
        },
      ),
    );
  }
}
