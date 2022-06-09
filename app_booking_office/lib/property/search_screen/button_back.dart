import 'package:app_booking_office/property/bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const BottomNavBar()));
      },
      child: const Icon(
        CupertinoIcons.arrow_left,
        color: Colors.black,
        size: 30,
      ),
    );
  }
}
