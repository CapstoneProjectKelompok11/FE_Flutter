import 'package:app_booking_office/property/bottom_navigation_bar.dart';
import 'package:app_booking_office/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';

import '../screen/booking_office/home_screen.dart';

class LoginSuccesfullDialog extends StatefulWidget {
  const LoginSuccesfullDialog({Key? key}) : super(key: key);

  @override
  State<LoginSuccesfullDialog> createState() => _LoginSuccesfullDialogState();
}

class _LoginSuccesfullDialogState extends State<LoginSuccesfullDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(8)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Succes!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'You can now continue to home page',
              style: TextStyle(fontSize: 17, color: Color(0xFF868686)),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.check_circle,
              size: 100,
              color: Colors.blue,
            )
          ],
        ),
        content: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const BottomNavBar()));
            },
            child: const Text('Continue')));
  }
}
