import 'package:flutter/material.dart';

import '../../../../../core/font_style_manager.dart';

class AuthFormField extends StatelessWidget {
  //final TextEditingController controller;
  final String name;
  const AuthFormField({
    /*required this.controller*/ super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20, top: 70),
      child: TextFormField(
        decoration: InputDecoration(
          label: Text(
            name,
          ),
          labelStyle: FontManager.interRegular13.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }
}
