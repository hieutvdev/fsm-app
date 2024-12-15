import 'package:flutter/material.dart';
import 'package:fsm_app/common/helpers/theme_mode/is_dark_mode.dart';

import '../../../config/theme/colors/app_colors.dart';

class TextFieldInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isSearch;
  final void Function(String)? onSearch;
  final IconButton? suffixIcon;
  final Color? fillColor;
  final bool showBorder;
  final Icon? prefixIcon;

  const TextFieldInput({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.isSearch = false,
    this.onSearch,
    this.suffixIcon,
    this.fillColor,
    this.showBorder = true,
    this.prefixIcon,
  });

  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onFieldSubmitted: widget.isSearch ? widget.onSearch : null,
      style: const TextStyle(fontSize: 12),
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        hintStyle: TextStyle(
            fontSize: 12,
            color: context.isDarkMode
                ? AppColors.grey
                : AppColors.lightBackground),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        filled: true,
        fillColor: widget.fillColor ?? Colors.transparent,
        border: widget.showBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              )
            : InputBorder.none,
        focusedBorder: widget.showBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.transparent),
              )
            : InputBorder.none,
        enabledBorder: widget.showBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.transparent),
              )
            : InputBorder.none,
        prefixIcon: widget.prefixIcon,
        hoverColor: Colors.transparent,
        suffixIcon: widget.suffixIcon ??
            (widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  )
                : null),
      ),
    );
  }
}
