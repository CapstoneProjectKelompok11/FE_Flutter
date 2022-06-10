import 'package:flutter/material.dart';

class ButtonCategorize extends StatelessWidget {
  const ButtonCategorize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      height: 40,
      width: 40,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black, width: 2)),
      child: ClipRect(
          child: Image.asset(
        'assets/icons/filter.png',
        color: Colors.black,
      )),
    );
  }
}
