import 'package:flutter/material.dart';

class ButtonStatus1 extends StatefulWidget {
  ButtonStatus1({Key? key}) : super(key: key);

  @override
  State<ButtonStatus1> createState() => _ButtonStatus1State();
}

class _ButtonStatus1State extends State<ButtonStatus1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      decoration: ShapeDecoration(
        color: const Color(0xFFFBCD0A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              primary: Colors.transparent,
              shadowColor: Colors.transparent),
          onPressed: () {},
          child: const Text(
            'Confirm & pay',
            style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.w600, color: Colors.black),
          )),
    );
  }
}
