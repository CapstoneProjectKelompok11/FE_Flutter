import 'package:app_booking_office/screen/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TokenExpired extends StatelessWidget {
  const TokenExpired({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
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
              'Alert!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Please relogin to continue',
              style: TextStyle(fontSize: 17, color: Color(0xFF868686)),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.warning_rounded,
              size: 100,
              color: Colors.orange,
            )
          ],
        ),
        content: ElevatedButton(
            onPressed: () {
              authViewModel.logout(context);
            },
            child: const Text('Sign out')));
  }
}
