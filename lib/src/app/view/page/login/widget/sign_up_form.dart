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

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(
            LoginEvent.submit(
              _nipController.text,
              _passwordController.text,
              widget.withTwoFactor,
              widget.urlAuthApi,
            ),
          );
    }
  }

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
      child: Form(
        key: _formKey,
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FTextFormField(
                  labelText: 'NIP',
                  controller: _nipController,
                  validator: requiredValidator.call,
                  errorText: state.maybeMap(
                    error: (value) => value.nip,
                    orElse: () => null,
                  ),
                ),
                const Gap(12),
                FTextFormField(
                  labelText: 'Password',
                  controller: _passwordController,
                  validator: requiredValidator.call,
                  obscureText: true,
                  errorText: state.maybeMap(
                    error: (value) => value.password,
                    orElse: () => null,
                  ),
                  onEditingComplete: state.maybeWhen(
                    loading: () => null,
                    orElse: () => _submit,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Button.action(
                        permission: null,
                        isInProgress: state.maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        ),
                        onPressed: _submit,
                        action: DataAction.login,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
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
      ),
    );
  }
}
