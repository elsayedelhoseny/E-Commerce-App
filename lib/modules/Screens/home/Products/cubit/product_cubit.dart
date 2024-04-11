import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:first_app/models/product_model.dart';
import 'package:first_app/modules/Screens/home/Products/cubit/product_state.dart';
import 'package:first_app/shared/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  List<ProductModel> products = [];
  void getProducts() async {
    Response response = await http.get(
        Uri.parse("https://student.valuxapps.com/api/home"),
        headers: {'Authorization': userToken!, 'lang': "en"});
    var responseBody = jsonDecode(response.body);

    if (responseBody['status'] == true) {
      for (var item in responseBody['data']['products']) {
        products.add(ProductModel.fromJson(data: item));
      }
      emit(ProductSuccess());
    } else {
      emit(ProductFailure());
    }
  }
}
