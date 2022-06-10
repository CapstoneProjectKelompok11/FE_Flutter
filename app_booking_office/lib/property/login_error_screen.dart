import 'package:app_booking_office/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';

class LoginErrorScreen extends StatefulWidget {
  const LoginErrorScreen({Key? key}) : super(key: key);

  @override
  State<LoginErrorScreen> createState() => _LoginErrorScreenState();
}

class _LoginErrorScreenState extends State<LoginErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog()
    );
  }

  Widget buttonRetry(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(77, 137, 255, 18.5),
            Colors.blueAccent,
            Color(0xFF4D89FF)
          ])),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              primary: Colors.transparent,
              shadowColor: Colors.transparent),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const LoginScreen()));
          },
          child: const Text('Retry')),
    );
  }
}
