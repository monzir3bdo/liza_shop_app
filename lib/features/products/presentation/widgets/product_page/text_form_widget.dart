import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  void Function(String)? onChangedFunction;
  FormFieldWidget(
      {super.key, required this.controller, required this.onChangedFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextField(
        controller: controller,
        onChanged: onChangedFunction,
        decoration: const InputDecoration(
          filled: true,
          prefixIcon: Icon(
            Icons.search_sharp,
            color: Colors.black,
          ),
          hintText: 'Search...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
