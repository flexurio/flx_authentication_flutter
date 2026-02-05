// ignore_for_file: invalid_use_of_protected_member

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class FTextPhoneField extends FormField<String> {
  FTextPhoneField({
    super.key,
    this.suffixText,
    this.onEditingComplete,
    this.errorText,
    this.maxLines = 1,
    this.labelText,
    this.obscureText = false,
    this.readOnly = false,
    this.suffixIcon,
    this.controller,
    this.helperText,
    this.inputFormatters,
    this.textAlign,
    this.focusNode,
    this.maxLength,
    this.hintText,
    this.onChanged,
    super.validator,
    super.enabled,
    this.onTapOutside,
    this.onSubmitted,
    this.isDense,
    this.prefix,
    this.fontSize,
    this.keyboardType,
    this.isGlass = false,
  }) : super(
          initialValue: controller?.text ?? '',
          builder: (field) {
            final error = errorText ?? field.errorText;
            var isNumber = false;
            if (inputFormatters != null) {
              if (inputFormatters[0] is ThousandsFormatter ||
                  inputFormatters[0] is CurrencyTextInputFormatter) {
                isNumber = true;
              }
            }
            return Builder(
              builder: (context) {
                final theme = Theme.of(context);
                final border = OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: error != null
                        ? Colors.red
                        : theme.modeCondition(
                            isGlass ? Colors.white : Colors.blueGrey.shade100,
                            const Color(0xff343640),
                          ),
                  ),
                );
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      keyboardType: keyboardType,
                      textAlign: textAlign ??
                          (isNumber ? TextAlign.right : TextAlign.left),
                      focusNode: focusNode,
                      readOnly: readOnly,
                      enabled: enabled,
                      onChanged: (value) {
                        field.setValue(value);
                        onChanged?.call(value);
                      },
                      inputFormatters: inputFormatters,
                      maxLength: maxLength,
                      maxLines: maxLines,
                      controller: controller,
                      obscureText: obscureText,
                      style: TextStyle(
                        color: theme.brightness == Brightness.dark
                            ? Colors.white70
                            : Colors.black87,
                      ),
                      onEditingComplete: onEditingComplete,
                      onTapOutside: onTapOutside,
                      onSubmitted: onSubmitted,
                      decoration: InputDecoration(
                        isDense: isDense,
                        counterText: '',
                        labelText: labelText,
                        hintText: hintText,
                        filled: true,
                        fillColor: theme.modeCondition(
                          isGlass
                              ? Colors.white38
                              : Colors.blueGrey.shade50.withOpacity(.5),
                          MyTheme.black00dp,
                        ),
                        suffixText: suffixText,
                        suffixIcon: suffixIcon,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(),
                            child: prefix,
                          ),
                        ),
                        suffixStyle: TextStyle(
                          color: theme.modeCondition(
                            Colors.black87,
                            Colors.white60,
                          ),
                        ),
                        enabledBorder: border,
                        border: border,
                      ),
                    ),
                    _HelperText(helperText),
                    ErrorTextField(errorText: errorText ?? field.errorText),
                  ],
                );
              },
            );
          },
        );

  final void Function()? onEditingComplete;
  final String? errorText;
  final int? maxLines;
  final String? labelText;
  final String? helperText;
  final int? maxLength;
  final bool obscureText;
  final bool readOnly;
  final Widget? suffixIcon;
  final String? suffixText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function(String)? onSubmitted;
  final bool? isDense;
  final TextAlign? textAlign;
  final Widget? prefix;
  final double? fontSize;
  final TextInputType? keyboardType;
  final bool isGlass;
}

class ErrorTextField extends StatelessWidget {
  const ErrorTextField({
    super.key,
    this.errorText,
  });

  final String? errorText;

  @override
  Widget build(BuildContext context) {
    if (errorText != null) {
      return Padding(
        padding: const EdgeInsets.only(left: 6, top: 6),
        child: Text(
          errorText!,
          style: const TextStyle(color: Colors.red, fontSize: 10),
        ),
      );
    }
    return const SizedBox();
  }
}

class _HelperText extends StatelessWidget {
  const _HelperText(this.text);

  final String? text;

  @override
  Widget build(BuildContext context) {
    if (text == null) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.only(left: 6, top: 6),
      child: Text(
        text!,
        style: TextStyle(color: Colors.grey.shade600, fontSize: 10),
      ),
    );
  }
}

final inputLetterOnly = [
  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]')),
];
