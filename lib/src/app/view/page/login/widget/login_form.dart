import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_authentication_flutter/src/app/view/widget/country_phone_code.dart';
import 'package:flx_authentication_flutter/src/app/view/widget/f_text_phone_field.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:gap/gap.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    required this.onSuccess,
    required this.withTwoFactor,
    required this.onSuccessWithTwoFactor,
    required this.urlAuthApi,
    required this.usernameLabel,
    required this.usingPassword,
    this.loginType = LoginFormType.nipPassword,
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
  final String usernameLabel;
  final bool usingPassword;
  final LoginFormType loginType;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipController = TextEditingController();
  final _passwordController = TextEditingController();
  String _phoneCode = '62';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      String username;
      if (widget.loginType == LoginFormType.phone) {
        username = '$_phoneCode${_nipController.text}'.replaceAll('+', '');
      } else {
        username = _nipController.text;
      }
      context.read<LoginBloc>().add(
            LoginEvent.submit(
              username,
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
                const Gap(30),
                _buildForm(state),
                if (widget.usingPassword) ...[
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
                ],
                const Gap(30),
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

  Widget _buildForm(LoginState state) {
    if (widget.loginType == LoginFormType.phone) {
      return FTextPhoneField(
        maxLength: 20,
        isGlass: true,
        labelText: widget.usernameLabel,
        controller: _nipController,
        validator: requiredValidator.call,
        prefix: CountryCodeDropdown(
          selectedCode: _phoneCode,
          onChanged: (code) {
            if (code != null) {
              setState(() {
                _phoneCode = code;
              });
            }
          },
        ),
        onChanged: (phone) {
          setState(() {});
        },
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        errorText: state.maybeMap(
          error: (value) => value.nip,
          orElse: () => null,
        ),
        onEditingComplete: state.maybeWhen(
          loading: () => null,
          orElse: () => _submit,
        ),
      );
    } else {
      return GlassTextFormField(
        labelText: widget.usernameLabel,
        controller: _nipController,
        validator: requiredValidator.call,
        errorText: state.maybeMap(
          error: (value) => value.nip,
          orElse: () => null,
        ),
      );
    }
  }
}

enum LoginFormType { phone, nipPassword }
