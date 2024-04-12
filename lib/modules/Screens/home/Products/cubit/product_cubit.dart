import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:first_app/models/category_model.dart';
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

  List<CategoryModel> categories = [];
  void getCategoriesData() async {
    Response response = await http.get(
        Uri.parse("https://student.valuxapps.com/api/categories"),
        headers: {'lang': "en"});
    final responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']['data']) {
        categories.add(CategoryModel.fromJson(data: item));
      }
      emit(GetCategoriesSuccessState());
    } else {
      emit(FailedToGetCategoriesState());
    }
  }

  List<ProductModel> favorites = [];
  // set مفيش تكرار
  Set<String> favoritesID = {};
  Future<void> getFavorites() async {
    favorites.clear();
    Response response = await http.get(
        Uri.parse("https://student.valuxapps.com/api/favorites"),
        headers: {"lang": "en", "Authorization": userToken!});
    // http
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      // loop list
      for (var item in responseBody['data']['data']) {
        // Refactoring
        favorites.add(ProductModel.fromJson(data: item['product']));
        favoritesID.add(item['product']['id'].toString());
      }
      print("Favorites number is : ${favorites.length}");
      emit(GetFavoritesSuccessState());
    } else {
      emit(FailedToGetFavoritesState());
    }
  }

  void addOrRemoveFromFavorites({required String productID}) async {
    Response response = await http.post(
        Uri.parse("https://student.valuxapps.com/api/favorites"),
        headers: {"lang": "en", "Authorization": userToken!},
        body: {"product_id": productID});
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      if (favoritesID.contains(productID) == true) {
        // delete
        favoritesID.remove(productID);
      } else {
        // add
        favoritesID.add(productID);
      }
      await getFavorites();
      emit(AddOrRemoveItemFromFavoritesSuccessState());
    } else {
      emit(FailedToAddOrRemoveItemFromFavoritesState());
    }
  }
}
