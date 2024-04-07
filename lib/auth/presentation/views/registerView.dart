// ignore_for_file: file_names

import 'package:first_app/auth/presentation/manger/cubit/auth_cubit.dart';
import 'package:first_app/auth/presentation/manger/cubit/auth_state.dart';
import 'package:first_app/core/widgets/CustomButton.dart';
import 'package:first_app/core/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Success')),
          );
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMessage)),
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: context.read<AuthCubit>().signUpFormKey,
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
                  controller: context.read<AuthCubit>().signUpName,
                  hintText: 'Name *',
                  bordercolor: Colors.black,
                ),
                const SizedBox(
                  height: 20,
                ),
                IntlPhoneField(
                  controller: context.read<AuthCubit>().signUpPhone,
                  decoration: const InputDecoration(
                      labelText: 'Phone',
                      hintText: 'Phone *',
                      border: OutlineInputBorder(borderSide: BorderSide())),
                  keyboardType: TextInputType.phone,
                  initialCountryCode: 'EG',
                ),
                CustomTextField(
                  labelText: 'Email',
                  controller: context.read<AuthCubit>().signUpEmail,
                  hintText: 'Email *',
                  bordercolor: Colors.black,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  obscureText: true,
                  labelText: 'Password',
                  controller: context.read<AuthCubit>().signUpPassword,
                  hintText: 'Password *',
                  bordercolor: Colors.black,
                ),
                const SizedBox(
                  height: 30,
                ),
                state is SignUpLoading
                    ? const CircularProgressIndicator()
                    : CustomButon(
                        onTap: () {
                          context.read<AuthCubit>().signUp();
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
