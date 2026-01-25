import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContinueWithButtonWidget extends StatelessWidget {
  const ContinueWithButtonWidget({
    required this.label,
    required this.iconAssetPath,
    required this.onPressed,
    super.key,
  });

  final String label;
  final String iconAssetPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        iconAssetPath,
        width: 24,
        height: 24,
      ),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
