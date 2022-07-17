import 'package:app_booking_office/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';

class SuccesfulScreen extends StatelessWidget {
  const SuccesfulScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'Registration\nSuccesful!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const Icon(
                Icons.check_circle_rounded,
                size: 120,
                color: Colors.green,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Your account has\nbeen succesfully created',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              buttonContinue(context)
            ]),
          ),
        ),
      ),
    );
  }

  Widget buttonContinue(BuildContext context) {
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
          child: const Text('Continue')),
    );
  }
}
