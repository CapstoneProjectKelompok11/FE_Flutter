import 'package:app_booking_office/screen/auth/login_screen.dart';
import 'package:app_booking_office/screen/auth/register_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  logoApp(),
                  const SizedBox(height: 28),
                  textWelcome(),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              elevatedButtonSignIn(),
              const SizedBox(
                height: 10,
              ),
              elevatedButtonSignUp()
            ],
          ),
        ),
      ),
    );
  }

  Widget logoApp() {
    return ClipRect(
      child: Stack(children: [
        Positioned(
            top: 30, left: 20, child: Image.asset('assets/image/Vector.png')),
        Positioned(child: Image.asset('assets/image/Home.png'))
      ]),
    );
  }

  Widget textWelcome() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Welcome.',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        Text(
          '''Kebutuhan ruang kerja\nadalah andalan kami.''',
          style: TextStyle(fontWeight: FontWeight.w500),
        )
      ],
    );
  }

  Widget elevatedButtonSignIn() {
    return Container(
        decoration: ShapeDecoration(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            gradient: const LinearGradient(colors: [
              Color.fromRGBO(77, 137, 255, 18.5),
              Colors.blueAccent,
              Color(0xFF4D89FF)
            ])),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              primary: Colors.transparent,
              shadowColor: Colors.transparent),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const LoginScreen()));
          },
          child: const Text('Sign in'),
        ));
  }

  Widget elevatedButtonSignUp() {
    return Container(
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(color: Colors.black)),
            color: Colors.white),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                primary: Colors.transparent,
                shadowColor: Colors.transparent),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const RegisterScreen()));
            },
            child: const Text(
              'Sign up',
              style: TextStyle(color: Colors.black),
            )));
  }
}
