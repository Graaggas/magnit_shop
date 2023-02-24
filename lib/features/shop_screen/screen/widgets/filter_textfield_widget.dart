import 'package:flutter/material.dart';

class FilterTextField extends StatelessWidget {
  final String hintText;
  const FilterTextField({
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
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
