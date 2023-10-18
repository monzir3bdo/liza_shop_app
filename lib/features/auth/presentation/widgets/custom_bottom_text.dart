import 'package:ecommerce/core/functions/navigation.dart';
import 'package:flutter/material.dart';

class CustomBottomText extends StatelessWidget {
  final String text;
  final String textButtonName;
  final String destination;
  const CustomBottomText(
      {required this.text,
      required this.textButtonName,
      required this.destination,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        TextButton(
          onPressed: () {
            customReplacmentNavigation(context, '/$destination');
          },
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero, alignment: Alignment.centerLeft),
          child: Text(
            textButtonName,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
