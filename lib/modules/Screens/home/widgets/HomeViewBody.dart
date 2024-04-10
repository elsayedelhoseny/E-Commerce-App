import 'package:first_app/modules/Screens/home/bannars/cubit/bannars_cubit.dart';
import 'package:first_app/modules/Screens/home/bannars/cubit/bannars_state.dart';
import 'package:first_app/modules/Screens/home/bannars/carousel_slider.dart';
import 'package:first_app/modules/Screens/home/bannars/dotIndicator.dart';
import 'package:first_app/modules/Screens/home/widgets/flashdeal.dart';
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
          SizedBox(
            height: 20,
          ),
          SearchView(),
          PCarouselSlider(),
          BlocConsumer<BannarsCubit, BannarsState>(
            builder: (context, state) {
              return DotIndicator(
                index: context.read<BannarsCubit>().currentIndex,
              );
            },
            listener: (BuildContext context, BannarsState state) {},
          ),
          FlashDealView(),
        ],
      ),
    );
  }
}
