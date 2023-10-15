import 'package:flutter/material.dart';

class ProductSizeButton extends StatelessWidget {
  final String buttonText;
  const ProductSizeButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
