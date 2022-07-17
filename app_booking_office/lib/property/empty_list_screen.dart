import 'package:flutter/material.dart';

class EmptyListScreen extends StatelessWidget {
  const EmptyListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Color(0xFFF4F4F4)),
      child: Center(
        child: ClipOval(
          child: Image.network(
            'https://i.pinimg.com/originals/49/e5/8d/49e58d5922019b8ec4642a2e2b9291c2.png',
            width: 220,
            height: 220,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
