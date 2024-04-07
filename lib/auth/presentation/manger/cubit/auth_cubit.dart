// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:first_app/auth/data/models/registerModel.dart';
import 'package:first_app/auth/presentation/manger/cubit/auth_state.dart';
import 'package:first_app/cache/cache_helper.dart';
import 'package:first_app/core/api/api_consumer.dart';
import 'package:first_app/core/api/end_ponits.dart';
import 'package:first_app/core/errors/exceptions.dart';
import 'package:flutter/material.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.api) : super(UserInitial());
  final ApiConsumer api;
  GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPhone = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();

  signIn() async {
    try {
      emit(SignInLoading());
      final response = await api.post(EndPoint.login, isFromData: true, data: {
        ApiKey.email: signInEmail.text,
        ApiKey.password: signInPassword.text
      });
      emit(SignInSuccess());
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errModel.errorMessage));
    }
  }

  signUp() async {
    try {
      emit(SignUpLoading());
      final response = await api.post(
        EndPoint.register,
        isFromData: true,
        data: {
          ApiKey.email: signUpEmail.text,
          ApiKey.password: signUpPassword.text,
          ApiKey.name: signUpName.text,
          ApiKey.phone: signUpPhone.text,
        },
      );
      final signUpModel = RegistrationResponse.fromJson(response);
      CacheHelper().saveData(key: ApiKey.token, value: signUpModel.data.token);
      emit(SignUpSuccess(message: signUpModel.message));
    } on ServerException catch (e) {
      emit(SignUpFailure(errMessage: e.errModel.errorMessage));
    }
  }
}
