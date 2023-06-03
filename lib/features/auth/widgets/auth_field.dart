import 'package:flutter/material.dart';
import 'package:riverpod_learning/theme/pallete.dart';

class Authfield extends StatelessWidget {
  final bool hide;
  final TextEditingController controller;
  final String hint;
  const Authfield({super.key,required this.controller,required this.hint,this.hide=false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hide,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(22),
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 16),
        focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Pallete.blueColor,width: 1.8)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Pallete.greyColor,width: 1.0)
        )
      ),
    );
  }
}
