import 'package:flutter/material.dart';

class ForgetPasswordWidget extends StatelessWidget {
  final String text;
  const ForgetPasswordWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
            onPressed: () {},
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.red,
              ),
            )),
      ),
    );
  }
}
