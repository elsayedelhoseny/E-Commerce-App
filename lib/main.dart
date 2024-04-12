import 'package:first_app/layout/layoutView.dart';
import 'package:first_app/modules/Screens/auth_screens/cubit/auth_cubit_cubit.dart';
import 'package:first_app/modules/Screens/auth_screens/defaultTabController.dart';
import 'package:first_app/modules/Screens/cart/cubit/cart_cubit.dart';
import 'package:first_app/modules/Screens/home/Products/cubit/product_cubit.dart';
import 'package:first_app/modules/Screens/home/bannars/cubit/bannars_cubit.dart';
import 'package:first_app/shared/bloc_observer/bloc_observer.dart';
import 'package:first_app/shared/constants/constants.dart';
import 'package:first_app/shared/network/local_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheNetwork.cacheInitialization();
  userToken = await CacheNetwork.getCacheData(key: 'token');
  currentPassword = await CacheNetwork.getCacheData(key: 'password');
  debugPrint("User token is : $userToken");
  debugPrint("Current Password is : $currentPassword");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => BannarsCubit()),
        BlocProvider(
            create: (context) => ProductCubit()
              ..getCategoriesData()
              ..getFavorites()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: userToken != null && userToken != ''
              ? const BottomNavBar()
              : const defaultTabController()),
    );
  }
}
