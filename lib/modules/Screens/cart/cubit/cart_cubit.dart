import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:first_app/models/product_model.dart';
import 'package:first_app/modules/Screens/cart/cubit/cart_state.dart';
import 'package:first_app/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<ProductModel> carts = [];
  int totalPrice = 0;
  Set<String> cartID = {};
  Future<void> getCarts() async {
    carts.clear();
    Response response = await http.get(
        Uri.parse("https://student.valuxapps.com/api/carts"),
        headers: {"Authorization": userToken!, "lang": "en"});
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']['cart_items']) {
        carts.add(ProductModel.fromJson(data: item['product']));
        cartID.add(item['product']['id'].toString());
      }
      totalPrice = responseBody['data']['total'];
      debugPrint("Carts length is : ${carts.length}");
      emit(GetCartsSuccessState());
    } else {
      emit(FailedToGetCartsState());
    }
  }

  void addOrRemoveFromCart({required String productID}) async {
    Response response = await http.post(
        Uri.parse("https://student.valuxapps.com/api/carts"),
        headers: {"lang": "en", "Authorization": userToken!},
        body: {"product_id": productID});
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      cartID.contains(productID) == true
          ? cartID.remove(productID)
          : cartID.add(productID);
      await getCarts();
      emit(AddOrRemoveItemFromCartSuccessState());
    } else {
      emit(FailedToAddOrRemoveItemFromCartState());
    }
  }
}
