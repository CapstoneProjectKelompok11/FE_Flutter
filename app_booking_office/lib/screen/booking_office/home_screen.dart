import 'package:app_booking_office/screen/auth/login_screen.dart';
import 'package:app_booking_office/screen/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'HomeScreen',
                style: TextStyle(fontSize: 50),
              ),
              ElevatedButton(
                  onPressed: () {
                    authViewModel.logout();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()));
                  },
                  child: const Text('Logout'))
            ],
          ),
        ),
      ),
    );
  }
}
