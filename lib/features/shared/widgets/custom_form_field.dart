import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:study/core/extension/size_extension.dart';
import 'package:study/core/mixins/validator.dart';

@immutable
final class CustomFormField extends StatelessWidget with Validator {
  const CustomFormField({
    required this.labelText,
    required this.controller,
    this.textInputAction = TextInputAction.next,
    this.keyboardType,
    this.autofillHints,
    this.focusNode,
    super.key,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    this.height,
    this.width,
    this.onFieldSubmitted,
    this.autoFocus = false,
    this.isOptional = false,
  });
  final double? width;
  final FocusNode? focusNode;
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Icon? prefixIcon;
  final double? height;
  final Iterable<String>? autofillHints;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final void Function(String)? onFieldSubmitted;
  final bool autoFocus;
  final bool isOptional;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width * 0.9,
      child: TextFormField(
        focusNode: focusNode,
        autofocus: !kIsWeb && autoFocus,
        keyboardType: keyboardType,
        autofillHints: autofillHints,
        autocorrect: false,
        textAlignVertical: TextAlignVertical.center,
        validator: (value) => isOptional
            ? validator?.call(value)
            : isNullOrEmptyValidator(value) ?? validator?.call(value),
        controller: controller,
        obscureText: obscureText,
        textInputAction: textInputAction,
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
