import 'package:flutter/material.dart';

class TextResult extends StatelessWidget {
  const TextResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Result for Jakarta',
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
    );
  }
}
