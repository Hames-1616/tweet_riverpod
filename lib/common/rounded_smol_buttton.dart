import 'package:flutter/material.dart';

class Roundedsmall extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Color bgcolor;
  final Color txtcolor;
  const Roundedsmall(
      {super.key,
      required this.onTap,
      required this.label,
      required this.bgcolor,
      required this.txtcolor
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Chip(label: Text(label,style: TextStyle(color: txtcolor,fontSize: 15),), 
      backgroundColor: bgcolor,
      labelPadding: const EdgeInsets.symmetric(vertical:5.0 ,horizontal: 20.0),
      ),
    );
  }
}
