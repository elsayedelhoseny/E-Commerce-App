import 'package:dio/dio.dart';
import 'package:first_app/auth/presentation/manger/cubit/auth_cubit.dart';
import 'package:first_app/auth/presentation/views/defaultTabController.dart';
import 'package:first_app/cache/cache_helper.dart';
import 'package:first_app/core/api/dio_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(DioConsumer(dio: Dio())),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: defaultTabController()),
    );
  }
}
