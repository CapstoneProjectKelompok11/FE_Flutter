import 'package:flutter/material.dart';

class EmptyFavoriteScreen extends StatelessWidget {
  const EmptyFavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Color(0xFFF4F4F4)),
      child: Center(
          child: Text(
        'You haven\'t add any favorite building yet.',
        style: TextStyle(
          color: Color(0xFF868686),
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      )),
    );
  }
}
