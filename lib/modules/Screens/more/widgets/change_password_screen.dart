import 'package:first_app/modules/Screens/more/cubit/profile_data_cubit.dart';
import 'package:first_app/modules/Screens/more/cubit/profile_data_state.dart';
import 'package:first_app/shared/constants/constants.dart';
import 'package:first_app/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 38, 94),
        centerTitle: true,
        title: const Text(
          'Change Password',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/image2/auth_background.png'),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: currentPasswordController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Current Password"),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: newPasswordController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "New Password"),
            ),
            const SizedBox(
              height: 24,
            ),
            BlocProvider(
              create: (context) => ProfileDataCubit(),
              child: BlocConsumer<ProfileDataCubit, ProfileDataState>(
                listener: (context, state) {
                  if (state is ChangePasswordSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Success')),
                    );
                    Navigator.pop(context);
                  } else if (state is ChangePasswordWithFailureState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  }
                },
                builder: (context, state) {
                  final cubit = BlocProvider.of<ProfileDataCubit>(context);

                  return MaterialButton(
                    color: mainColor,
                    onPressed: () {
                      if (currentPasswordController.text == currentPassword) {
                        if (newPasswordController.text.length >= 6) {
                          cubit.changePassword(
                              userCurrentPassword: currentPassword!,
                              newPassword: newPasswordController.text.trim());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'please, verify current password, try again later')),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'please, verify current password, try again later')),
                        );
                      }
                    },
                    child: state is ChangePasswordLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : const Text(
                            'Change Password',
                            style: TextStyle(color: Colors.white),
                          ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
