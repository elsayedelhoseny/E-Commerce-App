import 'dart:convert';

import 'package:first_app/models/banner_model.dart';
import 'package:first_app/modules/Screens/home/bannars/cubit/bannars_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class BannarsCubit extends Cubit<BannarsState> {
  BannarsCubit() : super(BannarsInitial());
  int currentIndex = 0;
  List<BannerModel> banners = [];
  void getBannersData() async {
    Response response =
        await http.get(Uri.parse("https://student.valuxapps.com/api/banners"));
    final responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']) {
        banners.add(BannerModel.fromJson(data: item));
      }
      emit(BannarsSuccess());
    } else {
      emit(BannarsFailure());
    }
  }

  void changeCurrentIndex(index) {
    currentIndex = index;
    emit(ChangeCurrentIndexState());
  }
}
