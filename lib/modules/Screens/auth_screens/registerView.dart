// ignore_for_file: file_names, must_be_immutable

import 'package:first_app/modules/Screens/auth_screens/cubit/auth_cubit_cubit.dart';
import 'package:first_app/modules/Screens/auth_screens/cubit/auth_cubit_state.dart';
import 'package:first_app/modules/Screens/home/homeView.dart';
import 'package:first_app/modules/Widgets/custom_button.dart';
import 'package:first_app/modules/Widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Success')),
          );
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeView(),
              ));
        } else if (state is FailedToRegisterState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
        return SingleChildScrollView(
          child: Form(
            key: cubit.signUpFormKey,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 40.0),
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  labelText: 'Name',
                  controller: cubit.signUpName,
                  hintText: 'Name *',
                  bordercolor: Colors.black,
                ),
                const SizedBox(
                  height: 20,
                ),
                IntlPhoneField(
                  controller: cubit.signUpPhone,
                  decoration: const InputDecoration(
                      labelText: 'Phone',
                      hintText: 'Phone *',
                      border: OutlineInputBorder(borderSide: BorderSide())),
                  keyboardType: TextInputType.phone,
                  initialCountryCode: 'EG',
                ),
                CustomTextField(
                  labelText: 'Email',
                  controller: cubit.signUpEmail,
                  hintText: 'Email *',
                  bordercolor: Colors.black,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  obscureText: true,
                  labelText: 'Password',
                  controller: cubit.signUpPassword,
                  hintText: 'Password *',
                  bordercolor: Colors.black,
                ),
                const SizedBox(
                  height: 30,
                ),
                state is RegisterLoadingState
                    ? const CircularProgressIndicator()
                    : CustomButon(
                        onTap: () {
                          context.read<AuthCubit>().register();
                        },
                        text: 'Register',
                        colortxt: Colors.white,
                        color: Colors.blue,
                        colorborder: const Color.fromARGB(255, 5, 64, 112),
                      ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
