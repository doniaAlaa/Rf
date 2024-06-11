import 'package:flutter/material.dart';

class ApiExceptionWidget extends StatelessWidget {
  final String title;
  const ApiExceptionWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title),
      ],
    );
  }
}
