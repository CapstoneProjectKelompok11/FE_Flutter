import 'package:app_booking_office/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';

class LoginSuccesfullDialog extends StatefulWidget {
  const LoginSuccesfullDialog({Key? key}) : super(key: key);

  @override
  State<LoginSuccesfullDialog> createState() => _LoginSuccesfullDialogState();
}

class _LoginSuccesfullDialogState extends State<LoginSuccesfullDialog> {
  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Center(
        child: Text(
          'Login SuccesFull',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      content: Icon(
        Icons.check_circle,
        size: 100,
        color: Color(0xFF4D89FF),
      ),
    );
  }
}
