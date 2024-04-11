import 'package:first_app/modules/Screens/home/Products/ProductView.dart';
import 'package:first_app/modules/Screens/home/Products/ShowAllProduct.dart';
import 'package:first_app/modules/Screens/home/Products/carousel_slider.dart';
import 'package:first_app/modules/Screens/home/bannars/cubit/bannars_cubit.dart';
import 'package:first_app/modules/Screens/home/bannars/cubit/bannars_state.dart';
import 'package:first_app/modules/Screens/home/bannars/carousel_slider.dart';
import 'package:first_app/modules/Screens/home/bannars/dotIndicator.dart';
import 'package:first_app/modules/Screens/home/widgets/CustomRoww.dart';
import 'package:first_app/modules/Screens/home/widgets/flashdeal.dart';
import 'package:first_app/modules/Screens/home/widgets/gridViewProduct.dart';
import 'package:first_app/modules/Screens/search/searchView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          SearchView(),
          BCarouselSlider(),
          BlocConsumer<BannarsCubit, BannarsState>(
            builder: (context, state) {
              return DotIndicator(
                index: context.read<BannarsCubit>().currentIndex,
              );
            },
            listener: (BuildContext context, BannarsState state) {},
          ),
          FlashDealView(),
          SizedBox(
            height: 15,
          ),
          PCarouselSlider(),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
                'assets/image2/m037t0020_b_black_friday_flyer_10july023.jpg'),
          ),
          SizedBox(
            height: 15,
          ),
          CustomRoww(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowAllProduct(),
                  ));
            },
            tx1: 'All Products',
            tx2: 'View All',
          ),
          SizedBox(
            height: 20,
          ),
          GridViewProduct()
        ],
      ),
    );
  }
}
