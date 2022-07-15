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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var checkLogin = Provider.of<AuthViewModel>(context, listen: false);
      await checkLogin.checkLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF4D89FF),
        body: Stack(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(90),
              child: ClipRect(
                child: Image.asset("assets/image/logo.png"),
              ),
            )),
            Positioned(
                top: 0,
                right: 0,
                child: ClipRect(
                  child: Image.asset('assets/image/Vector2.png'),
                )),
            Positioned(
                top: 150,
                right: 25,
                child: ClipRect(
                  child: Image.asset('assets/image/Ellipse 13.png'),
                )),
            Positioned(
                bottom: 0,
                left: 0,
                child: ClipRect(
                  child: Image.asset('assets/image/Vector3.png'),
                )),
            Positioned(
                left: 0,
                bottom: 200,
                child: ClipRect(
                  child: Image.asset('assets/image/Ellipse 14.png'),
                ))
          ],
        ));
  }
}
