import 'package:flutter/material.dart';

const _fieldHeight = 40.0;

class FilterTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  const FilterTextField({
    required this.hintText,
    this.controller,
    this.focusNode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _fieldHeight,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(37.0),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black26,
          ),
          contentPadding: const EdgeInsets.all(10.0),
          filled: true,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black45,
          ),
          hintText: hintText,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
