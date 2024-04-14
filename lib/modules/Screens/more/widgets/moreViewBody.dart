// ignore_for_file: file_names

import 'package:first_app/modules/Screens/auth_screens/cubit/auth_cubit_cubit.dart';
import 'package:first_app/modules/Screens/auth_screens/cubit/auth_cubit_state.dart';
import 'package:first_app/modules/Screens/auth_screens/defaultTabController.dart';
import 'package:first_app/modules/Screens/more/cubit/profile_data_cubit.dart';
import 'package:first_app/modules/Screens/more/cubit/profile_data_state.dart';
import 'package:first_app/modules/Screens/more/widgets/ScrollView.dart';
import 'package:first_app/modules/Screens/more/widgets/General.dart';
import 'package:first_app/modules/Screens/more/widgets/customRow.dart';
import 'package:first_app/modules/Screens/more/widgets/help_supportView.dart';
import 'package:first_app/modules/Screens/more/widgets/profileView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreViewBody extends StatelessWidget {
  const MoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ));
                    },
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage("assets/image2/avatar.png"),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  BlocProvider(
                    create: (context) => ProfileDataCubit()..getUserData(),
                    child: BlocBuilder<ProfileDataCubit, ProfileDataState>(
                      builder: (context, state) {
                        final cubit =
                            BlocProvider.of<ProfileDataCubit>(context);
                        return Text(
                          cubit.userModel!.name!,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        );
                      },
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.dark_mode_rounded,
                    color: Colors.white,
                    size: 40,
                  )
                ],
              ),
            )),
        Expanded(
          flex: 4,
          child: Container(
            width: double.infinity,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 228, 226, 226)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CScrollView(),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'General',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const General(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Help & Support',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Help_SupportView(),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocProvider(
                      create: (context) => AuthCubit(),
                      child: BlocConsumer<AuthCubit, AuthStates>(
                        listener: (context, state) {
                          if (state is LogoutSuccessState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Success')),
                            );
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const defaultTabController(),
                                ));
                          } else if (state is FailedToLogoutState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)),
                            );
                          }
                        },
                        builder: (context, state) {
                          final cubit = context.read<AuthCubit>();
                          return CRow(
                            onTap: () {
                              // cubit.logout();
                            },
                            icon: Icons.logout,
                            txt: 'Logout',
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
