import 'package:flutter/material.dart';

class ContinueButtonWidget extends StatelessWidget {
  const ContinueButtonWidget({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text('Continue'),
      ),
    );
  }
}
