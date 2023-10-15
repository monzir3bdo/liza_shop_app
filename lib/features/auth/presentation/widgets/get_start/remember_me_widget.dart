import 'package:flutter/material.dart';

import 'custom_cupertion_switch.dart';

class RememberMeWidget extends StatelessWidget {
  const RememberMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Text('Remember Me'),
          SizedBox(
            width: 210,
          ),
          CustomCupertinoSwitch(),
        ],
      ),
    );
  }
}
