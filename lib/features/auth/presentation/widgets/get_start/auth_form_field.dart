import 'package:flutter/material.dart';

import '../../../../../core/font_style_manager.dart';

class AuthFormField extends StatelessWidget {
  final String name;
  void Function(String) onChanged;

  AuthFormField({
    super.key,
    required this.name,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20, top: 70),
      child: TextFormField(
        onChanged: onChanged,
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
