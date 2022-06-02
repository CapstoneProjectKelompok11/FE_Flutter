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
  bool _isVisible = true;

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
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign in to continue',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                  height: 5,
                ),
                checkBoxRememberMe(),
                const SizedBox(
                  height: 15,
                ),
                elevatedButtonLogin(),
                const SizedBox(
                  height: 5,
                ),
                signUpTextButton(),
                const SizedBox(
                  height: 25,
                ),
                textOrLoginWith(),
                const SizedBox(
                  height: 20,
                ),
                //button login with google mail
                buttonLoginGoogle(),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget textFormFieldEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Email'),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
        ),
      ],
    );
  }

  Widget textFormFieldPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Passoword'),
        const SizedBox(height: 10),
        TextFormField(
          controller: passwordController,
          obscureText: _isVisible,
          autocorrect: false,
          enableSuggestions: false,
          decoration: InputDecoration(
              suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  child: _isVisible
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
        ),
      ],
    );
  }

  Widget elevatedButtonLogin() {
    return SizedBox(
      width: MediaQuery.of(context).size.height,
      child: ElevatedButton(
          onPressed: () {
            authViewModel.login(
                emailController.text, passwordController.text, context);
          },
          child: const Text('Sign in')),
    );
  }

  Widget signUpTextButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Does\'t have account? '),
        TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const RegisterScreen()));
            },
            child: const Text('Sign up'))
      ],
    );
  }

  Widget checkBoxRememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
                value: authViewModel.isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    authViewModel.isChecked = value!;
                  });
                }),
            const SizedBox(
              width: 2,
            ),
            const Text('Remember Me'),
          ],
        ),
        TextButton(onPressed: () {}, child: const Text('Forgot password?'))
      ],
    );
  }

  Widget textOrLoginWith() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 2,
            decoration: BoxDecoration(color: Colors.grey[300]),
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        const Text(
          'Or Sign in with',
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(
          width: 2,
        ),
        Expanded(
          child: Container(
            height: 2,
            decoration: BoxDecoration(color: Colors.grey[300]),
          ),
        ),
      ],
    );
  }

  Widget buttonLoginGoogle() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          onPressed: () {}, child: const Text('Sign in with google')),
    );
  }
}
