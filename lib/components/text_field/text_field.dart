import 'package:flutter/material.dart';

class TtextField extends StatelessWidget {
  const TtextField({
    super.key,
    this.hintText,
    this.controller,
    this.onTap,
    this.maxLines,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
  });
  final String? hintText;
  final TextEditingController? controller;
  final void Function()? onTap;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      maxLines: maxLines,
      focusNode: focusNode,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        label: Text(hintText ?? ''),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
