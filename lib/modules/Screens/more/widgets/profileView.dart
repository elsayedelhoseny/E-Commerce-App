// ignore_for_file: file_names

import 'package:first_app/modules/Screens/more/cubit/profile_data_cubit.dart';
import 'package:first_app/modules/Screens/more/cubit/profile_data_state.dart';
import 'package:first_app/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'change_password_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileDataCubit()..getUserData(),
      child: BlocConsumer<ProfileDataCubit, ProfileDataState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<ProfileDataCubit>(context);
          if (cubit.userModel == null) cubit.getUserData();
          return Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 6, 38, 94),
                centerTitle: true,
                title: const Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
              ),
              backgroundColor: const Color.fromARGB(255, 228, 226, 226),
              body: cubit.userModel != null
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(cubit.userModel!.image!),
                            radius: 70,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(cubit.userModel!.name!),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(cubit.userModel!.email!),
                          const SizedBox(
                            height: 170,
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return ChangePasswordScreen();
                                },
                              ));
                            },
                            color: mainColor,
                            textColor: Colors.white,
                            child: const Text("Change Password"),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          MaterialButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             UpdateUserDataScreen()));
                            },
                            color: mainColor,
                            textColor: Colors.white,
                            child: const Text("Update Data"),
                          )
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ));
        },
      ),
    );
  }
}
