import 'package:app_booking_office/screen/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //when fisrt app launching it will running function check login to check is there data user login in local storage
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var checkLogin = Provider.of<AuthViewModel>(context, listen: false);
      await checkLogin.checkLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://developers.google.com/learn/images/flutter/flutter_logo.jpg'),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
