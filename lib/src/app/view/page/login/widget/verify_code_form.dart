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
    return BlocListener<VerifyCodeBloc, VerifyCodeState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (accessToken, permissions, data) {
            AuthenticationBloc.instance.add(
              AuthenticationEvent.login(accessToken, permissions, data),
            );
          },
          error: (errorMsg) {
            if (errorMsg.isNotEmpty) {
              Toast(context).fail('Verification Failed\n$errorMsg');
            }
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
                  height: 52,
                  width: 52,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E293B),
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    border: Border.all(
                      color: const Color(0xFFCBD5E1),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  height: 52,
                  width: 52,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E293B),
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    border: Border.all(
                      color: const Color(0xFF3B82F6),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                submittedPinTheme: PinTheme(
                  height: 52,
                  width: 52,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E293B),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFF94A3B8),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(12),
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
