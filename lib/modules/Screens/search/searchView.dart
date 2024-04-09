// ignore_for_file: file_names

import 'package:first_app/modules/Widgets/textformfield.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextField(
        backgroundcolor: Colors.white,
        bordercolor: Colors.white,
        labelText: 'Search Product ...',
        labelStyle: const TextStyle(fontSize: 15),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(
            right: 2,
          ),
          child: Container(
            width: 20,
            height: 50,
            color: const Color.fromARGB(255, 13, 92, 156),
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
