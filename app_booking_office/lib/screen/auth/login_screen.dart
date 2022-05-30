import 'package:app_booking_office/screen/auth/register_screen.dart';
import 'package:app_booking_office/screen/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late AuthViewModel authViewModel;

  Future<void> initDatausers() async {
    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) async {
        authViewModel = Provider.of<AuthViewModel>(context, listen: false);
        await authViewModel.getUser();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    initDatausers();
  }

  @override
  Widget build(BuildContext context) {
    authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            textFormFieldEmail(),
            const SizedBox(
              height: 10,
            ),
            textFormFieldPassword(),
            const SizedBox(
              height: 15,
            ),
            elevatedButtonLogin(),
            const SizedBox(
              height: 5,
            ),
            bottomSection(),
          ],
        ),
      )),
    );
  }

  Widget textFormFieldEmail() {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
    );
  }

  Widget textFormFieldPassword() {
    return TextFormField(
      controller: passwordController,
      decoration: InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
    );
  }

  Widget elevatedButtonLogin() {
    return ElevatedButton(
        onPressed: () {
          authViewModel.login(
              emailController.text, passwordController.text, context);
        },
        child: const Text('Login'));
  }

  Widget bottomSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Dont have an account? '),
        TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const RegisterScreen()));
            },
            child: const Text('Register Now'))
      ],
    );
  }
}
