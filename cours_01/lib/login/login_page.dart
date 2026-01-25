import 'package:cours_01/res/colors.dart';
import 'package:cours_01/widgets/continue_button_widget.dart';
import 'package:cours_01/widgets/continue_with_button_widget.dart';
import 'package:cours_01/widgets/email_field_widget.dart';
import 'package:cours_01/widgets/or_separator_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log in or sign up',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const EmailFieldWidget(),
            const SizedBox(height: 16),
            ContinueButtonWidget(onPressed: () {}),
            const SizedBox(height: 16),
            const OrSeparatorWidget(),
            const SizedBox(height: 16),
            ContinueWithButtonWidget(
              label: 'Continue with Google',
              iconAssetPath: 'assets/google_logo.svg',
              onPressed: () {},
            ),
            const SizedBox(height: 8),
            ContinueWithButtonWidget(
              label: 'Continue with Facebook',
              iconAssetPath: 'assets/facebook_logo.svg',
              onPressed: () {},
            ),
            const SizedBox(height: 8),
            ContinueWithButtonWidget(
              label: 'Continue with Apple',
              iconAssetPath: 'assets/apple_logo.svg',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
