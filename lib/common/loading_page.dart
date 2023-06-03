import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class loader extends StatelessWidget {
  const loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Loading(),
    );
  }
}
