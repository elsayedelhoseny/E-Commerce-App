// ignore_for_file: file_names

import 'package:first_app/modules/Screens/auth_screens/cubit/auth_cubit_cubit.dart';
import 'package:first_app/modules/Screens/auth_screens/cubit/auth_cubit_state.dart';
import 'package:first_app/modules/Widgets/custom_button.dart';
import 'package:first_app/modules/Widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Success')),
          );
        } else if (state is FailedToLoginState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('')),
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: context.read<AuthCubit>().signInFormKey,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 40.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomTextField(
                  labelText: 'Email',
                  controller: context.read<AuthCubit>().signInEmail,
                  hintText: 'Email *',
                  bordercolor: Colors.black,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  obscureText: true,
                  controller: context.read<AuthCubit>().signInPassword,
                  hintText: 'Password *',
                  labelText: 'Password',
                  bordercolor: Colors.black,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.only(left: 180.5),
                    child: Text(
                      'Forget Password ?',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                state is LoginLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : CustomButon(
                        text: 'Login',
                        onTap: () {
                          context
                              .read<AuthCubit>()
                              .login(email: '', password: '');
                        },
                        colortxt: Colors.white,
                        color: Colors.blue,
                        colorborder: const Color.fromARGB(255, 5, 64, 112),
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}
