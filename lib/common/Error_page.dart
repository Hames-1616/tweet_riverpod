import 'package:flutter/material.dart';

class Error_text extends StatelessWidget {
  final String error;
  const Error_text({super.key,required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}

class Error_page extends StatelessWidget {
  final String error;
  const Error_page({super.key,required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Error_text(error: error),
    );
  }
}