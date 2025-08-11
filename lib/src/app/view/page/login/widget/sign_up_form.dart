import 'package:flutter/material.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

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
  final void Function(
    String token,
    List<String> permission,
    Map<String, dynamic> data,
  ) onSuccess;
  final bool withTwoFactor;
  final String? urlAuthApi;
  final Widget form;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
          successWithTwoFactor: widget.onSuccessWithTwoFactor,
          success: widget.onSuccess,
          orElse: () {},
        );
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.form,
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
        },
      ),
    );
  }
}
