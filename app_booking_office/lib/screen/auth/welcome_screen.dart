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
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logoApp(),
              const SizedBox(height: 20),
              textWelcome(),
              const SizedBox(
                height: 25,
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
    return Center(
      child: Container(
        width: 150,
        height: 150,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://developers.google.com/learn/images/flutter/flutter_logo.jpg'),
                fit: BoxFit.cover)),
      ),
    );
  }

  Widget textWelcome() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Welcome.',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
          Text(
            '''Lorem ipsum dolor sit amet,
consectetur adipiscing elit.
In volutpat cras ''',
            style: TextStyle(fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Widget elevatedButtonSignIn() {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const LoginScreen()));
          },
          child: const Text('Sign in'),
        ));
  }

  Widget elevatedButtonSignUp() {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const RegisterScreen()));
            },
            child: const Text('Sign up')));
  }
}
