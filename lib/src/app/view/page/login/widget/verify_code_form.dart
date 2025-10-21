import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_authentication_flutter/src/app/util/on_login_success.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class VerifyCodeForm extends StatefulWidget {
  const VerifyCodeForm._({
    required this.onBackPressed,
    required this.authId,
    required this.onLoginSuccess,
    required this.pinLength,
    required this.urlAuthApiTwoFactor,
  });

  static Widget prepare({
    required void Function() onBackPressed,
    required String authId,
    required OnLoginSuccess onLoginSuccess,
    required int pinLength,
    required String? urlAuthApiTwoFactor,
  }) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => VerifyCodeBloc())],
      child: VerifyCodeForm._(
        onBackPressed: onBackPressed,
        authId: authId,
        onLoginSuccess: onLoginSuccess,
        pinLength: pinLength,
        urlAuthApiTwoFactor: urlAuthApiTwoFactor,
      ),
    );
  }

  final void Function() onBackPressed;
  final String authId;
  final int pinLength;
  final OnLoginSuccess onLoginSuccess;
  final String? urlAuthApiTwoFactor;

  @override
  State<VerifyCodeForm> createState() => _VerifyCodeFormState();
}

class _VerifyCodeFormState extends State<VerifyCodeForm> {
  final _codeController = TextEditingController();

  void _submit() {
    context.read<VerifyCodeBloc>().add(
          VerifyCodeEvent.submit(
            widget.authId,
            _codeController.text,
            widget.onLoginSuccess,
            widget.urlAuthApiTwoFactor,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<VerifyCodeBloc, VerifyCodeState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (accessToken, permissions, data) {
            AuthenticationBloc.instance.add(
              AuthenticationEvent.login(accessToken, permissions, data),
            );
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<VerifyCodeBloc, VerifyCodeState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Verify Code',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: -9,
                    child: BackButton(onPressed: widget.onBackPressed),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Enter the verification code we just sent you on your '
                'Telegram account.',
                textAlign: TextAlign.center,
              ),
              const Gap(24),
              Pinput(
                enableInteractiveSelection: true,
                autofocus: true,
                length: widget.pinLength,
                controller: _codeController,
                defaultPinTheme: PinTheme(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          theme.modeCondition(Colors.white54, Colors.black12),
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: theme.modeCondition(Colors.white38, Colors.black12),
                  ),
                ),
                onCompleted: state.maybeWhen(
                  loading: () => null,
                  orElse: () => (_) => _submit(),
                ),
              ),
              const SizedBox(height: 36),
              Button.action(
                permission: null,
                onPressed: state.maybeWhen(
                  loading: () => null,
                  orElse: () => _submit,
                ),
                action: DataAction.verify,
              ),
            ],
          );
        },
      ),
    );
  }
}
