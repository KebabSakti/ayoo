import 'package:flutter/material.dart';

class AyoTextFormField extends StatelessWidget {
  final String hintText;
  final String validateErrorText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final int maxLines;
  final Function validator;
  final TextInputAction textInputAction;

  AyoTextFormField({
    this.hintText,
    this.validateErrorText,
    this.textInputType,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.next,
    this.validator,
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: false,
      style: TextStyle(fontSize: 14, color: Colors.grey[800]),
      cursorColor: Colors.grey[800],
      cursorWidth: 1,
      keyboardType: textInputType,
      maxLines: maxLines,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        isDense: true, // Added this
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
        ),
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      validator: validator,
    );
  }
}
