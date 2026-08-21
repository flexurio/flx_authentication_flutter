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
    this.config,
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
  final LoginConfig? config;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipController = TextEditingController();
  final _passwordController = TextEditingController();
  String _phoneCode = '62';
  bool _obscurePassword = true;

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
    final title = widget.config?.rightPanel?.title ?? 'Welcome back';
    final subtitle =
        widget.config?.rightPanel?.subtitle ?? 'Please sign in to your account';

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
          successWithTwoFactor: widget.onSuccessWithTwoFactor,
          success: widget.onSuccess,
          error: (nip, password, other) {
            final errors = <String>[];
            if (nip != null && nip.isNotEmpty) {
              errors.add('${widget.usernameLabel}: $nip');
            }
            if (password != null && password.isNotEmpty) {
              errors.add('Password: $password');
            }
            if (other != null && other.isNotEmpty) {
              errors.add(other);
            }

            if (errors.isNotEmpty) {
              Toast(context).fail(
                'Sign-In Failed\n${errors.join('\n')}',
              );
            }
          },
          orElse: () {},
        );
      },
      child: Form(
        key: _formKey,
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (widget.config == null) {
              return _buildClassicForm(context, state);
            }
            return _buildConfigForm(context, state, title, subtitle);
          },
        ),
      ),
    );
  }

  Widget _buildClassicForm(BuildContext context, LoginState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Color(0xFF0F172A), Color(0xFF334155)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: const Text(
                'Welcome Back',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Colors.white,
                  letterSpacing: -1,
                ),
              ),
            ),
            const Gap(8),
            Text(
              'Please sign in to your account to continue.',
              style: TextStyle(
                fontSize: 16,
                color: const Color(0xFF475569).withValues(alpha: 0.8),
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
        const Gap(32),
        _buildClassicUsernameField(state),
        if (widget.usingPassword) ...[
          const Gap(12),
          GlassTextFormField(
            labelText: 'Password',
            controller: _passwordController,
            validator: requiredValidator.call,
            obscureText: true,
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
  }

  Widget _buildClassicUsernameField(LoginState state) {
    if (widget.loginType == LoginFormType.phone) {
      return FTextPhoneField(
        maxLength: 50,
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
      );
    }
  }

  Widget _buildConfigForm(
    BuildContext context,
    LoginState state,
    String title,
    String subtitle,
  ) {
    final isLoading = state.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 26,
                color: Color(0xFF1E293B),
                letterSpacing: -0.5,
              ),
            ),
            const Gap(6),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF64748B),
              ),
            ),
          ],
        ),
        const Gap(24),
        // NIP / Username field
        _buildUsernameField(state),
        if (widget.usingPassword) ...[
          const Gap(16),
          _buildPasswordField(state),
        ],
        const Gap(28),
        // Submit Button
        SizedBox(
          height: 48,
          child: ElevatedButton(
            onPressed: isLoading ? null : _submit,
            style: ElevatedButton.styleFrom(
              backgroundColor: flavorConfig.color,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildUsernameField(LoginState state) {
    if (widget.loginType == LoginFormType.phone) {
      return FTextPhoneField(
        maxLength: 50,
        isGlass: false,
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
        onEditingComplete: state.maybeWhen(
          loading: () => null,
          orElse: () => _submit,
        ),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.usernameLabel,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF334155),
            ),
          ),
          const Gap(6),
          TextFormField(
            controller: _nipController,
            validator: requiredValidator.call,
            style: const TextStyle(fontSize: 14, color: Color(0xFF1E293B)),
            decoration: InputDecoration(
              hintText: 'Enter your ${widget.usernameLabel}',
              hintStyle:
                  const TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
              prefixIcon: const Icon(
                Icons.badge_outlined,
                size: 20,
                color: Color(0xFF64748B),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              filled: true,
              fillColor: const Color(0xFFF8FAFC),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: flavorConfig.color, width: 1.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.redAccent),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Colors.redAccent, width: 1.5),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildPasswordField(LoginState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Password',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF334155),
              ),
            ),
            GestureDetector(
              onTap: () {
                Toast(context).notify(
                  'Please contact your administrator to reset password.',
                );
              },
              child: Text(
                'Forgot?',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: flavorConfig.color,
                ),
              ),
            ),
          ],
        ),
        const Gap(6),
        TextFormField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          validator: requiredValidator.call,
          onEditingComplete: state.maybeWhen(
            loading: () => null,
            orElse: () => _submit,
          ),
          style: const TextStyle(fontSize: 14, color: Color(0xFF1E293B)),
          decoration: InputDecoration(
            hintText: 'Enter password',
            hintStyle: const TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
            prefixIcon: const Icon(
              Icons.lock_outline,
              size: 20,
              color: Color(0xFF64748B),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                size: 20,
                color: const Color(0xFF64748B),
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            filled: true,
            fillColor: const Color(0xFFF8FAFC),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: flavorConfig.color, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}

enum LoginFormType { phone, nipPassword }
