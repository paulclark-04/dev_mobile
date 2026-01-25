import 'package:flutter/material.dart';

class OrSeparatorWidget extends StatelessWidget {
  const OrSeparatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Or'),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}
