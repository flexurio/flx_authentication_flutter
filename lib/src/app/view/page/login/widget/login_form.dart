import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:gap/gap.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    required this.onSuccess,
    required this.withTwoFactor,
    required this.onSuccessWithTwoFactor,
    required this.urlAuthApi,
    super.key,
  });

  final void Function(String authId) onSuccessWithTwoFactor;
  final void Function(
    String token,
    List<String> permission,
    Map<String, dynamic> data,
  ) onSuccess;
  final bool withTwoFactor;
  final String? urlAuthApi;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
                const Text(
                  'Company Sign-In',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(height: 30),
                GlassTextFormField(
                  labelText: 'NIP',
                  controller: _nipController,
                  validator: requiredValidator.call,
                  errorText: state.maybeMap(
                    error: (value) => value.nip,
                    orElse: () => null,
                  ),
                ),
                const Gap(12),
                GlassTextFormField(
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
                Button.action(
                  permission: null,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: _submit,
                  action: DataAction.login,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
