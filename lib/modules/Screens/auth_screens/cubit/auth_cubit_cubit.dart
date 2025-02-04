import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:first_app/modules/Screens/auth_screens/cubit/auth_cubit_state.dart';
import 'package:first_app/shared/constants/constants.dart';
import 'package:first_app/shared/network/local_network.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpPhone = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();

  void register() async {
    emit(RegisterLoadingState());
    try {
      Response response = await http.post(
        Uri.parse('https://student.valuxapps.com/api/register'),
        body: {
          'name': signUpName.text,
          'email': signUpEmail.text,
          'password': signUpPassword.text,
          'phone': signUpPhone.text,
          'image': "jdfjfj"
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          debugPrint("Response is : $data");
          emit(RegisterSuccessState());
        } else {
          debugPrint("Response is : $data");
          emit(FailedToRegisterState(message: data['message']));
        }
      }
    } catch (e) {
      debugPrint("Failed to Register , reason : $e");
      emit(FailedToRegisterState(message: e.toString()));
    }
  }

  // Account : mo.ha@gmail.com , password : 123456
  void login() async {
    emit(LoginLoadingState());
    try {
      Response response = await http.post(
        Uri.parse('https://student.valuxapps.com/api/login'),
        body: {'email': signInEmail.text, 'password': signInPassword.text},
      );
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] == true) {
          await CacheNetwork.insertToCache(
              key: "token", value: responseData['data']['token']);
          await CacheNetwork.insertToCache(
              key: "password", value: signInPassword.text);
          userToken = await CacheNetwork.getCacheData(key: "token");
          currentPassword = await CacheNetwork.getCacheData(key: "password");
          emit(LoginSuccessState());
        } else {
          debugPrint("Failed to login, reason is : ${responseData['message']}");
          emit(FailedToLoginState(message: responseData['message']));
        }
      }
    } catch (e) {
      emit(FailedToLoginState(message: e.toString()));
    }
  }

  String? chosenValue;
  void changeDropDownValue({required String val}) {
    chosenValue = val;
    emit(ChangeValueSuccessState());
  }

  // void logout() async {
  //   var headers = {"lang": "en", "Authorization": userToken!};
  //   var request = http.Request(
  //       'POST', Uri.parse('https://student.valuxapps.com/api/logout'));
  //   request.body = json.encode({"fcm_token": "SomeFcmToken"});
  //   request.headers.addAll(headers);

  //   try {
  //     http.StreamedResponse response = await request.send();
  //     if (response.statusCode == 200) {
  //       print(await response.stream.bytesToString());
  //       await CacheNetwork.clearData();
  //       emit(LogoutSuccessState());
  //     } else {
  //       print(response.reasonPhrase);
  //     }
  //   } catch (e) {
  //     emit(FailedToLogoutState(message: e.toString()));
  //     // Handle any errors during logout
  //   }
  // }
}
