import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginFailedDialog extends StatelessWidget {
  const LoginFailedDialog({Key? key}) : super(key: key);

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
              'Oops!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Please enter valid email or password',
              style: TextStyle(fontSize: 17, color: Color(0xFF868686)),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.warning_rounded,
              size: 100,
              color: Colors.red,
            )
          ],
        ),
        content: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Try Again')));
  }
}
