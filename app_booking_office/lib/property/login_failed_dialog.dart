import 'package:flutter/material.dart';

class LoginFailedDialog extends StatelessWidget {
  const LoginFailedDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      actions: [
        Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Retry')),
        )
      ],
      title: const Center(
        child: Text(
          'Login Failed',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      content: const Icon(
        Icons.cancel,
        size: 100,
        color: Colors.red,
      ),
    );
  }
}
