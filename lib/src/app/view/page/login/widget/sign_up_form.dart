import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    required this.onSuccess,
    required this.withTwoFactor,
    required this.onSuccessWithTwoFactor,
    required this.urlAuthApi,
    required this.onTapSignIn,
    required this.form,
    super.key,
  });

  final void Function(String authId) onSuccessWithTwoFactor;
  final VoidCallback onTapSignIn;
  final void Function() onSuccess;
  final bool withTwoFactor;
  final String? urlAuthApi;
  final Widget Function({required VoidCallback onSuccess}) form;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.form(
          onSuccess: widget.onSuccess,
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Already have an account? ',
              style: TextStyle(color: Color(0xFF718096)),
            ),
            GestureDetector(
              onTap: widget.onTapSignIn,
              child: const Text(
                'Sign In',
                style: TextStyle(
                  color: Color(0xFF6366f1),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
