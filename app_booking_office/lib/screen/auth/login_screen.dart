import 'package:app_booking_office/screen/auth/register_screen.dart';
import 'package:app_booking_office/screen/auth/view_model/auth_view_model.dart';
import 'package:app_booking_office/screen/booking_office/detail_screen.dart';
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
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    authViewModel = Provider.of<AuthViewModel>(context);
    // final isError = authViewModel.states == AuthViewState.error;
    // if (isError) {
    //   return const Center(child: AlertDialogErrorLogin());
    // }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                        width: 45,
                        height: 45,
                        child: ClipRect(
                            child: Image.asset('assets/image/logo2.png'))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Sign in to continue',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
        ),
      )),
    );
  }

  Widget textFormFieldEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email',
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
              hintStyle: const TextStyle(fontSize: 12),
              suffixIcon: const Icon(
                Icons.alternate_email,
                color: Colors.black,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8))),
          validator: (email) {
            if (email != null && email.isEmpty) {
              return 'This field cannot be empty';
            }
          },
        ),
      ],
    );
  }

  Widget textFormFieldPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Passoword',
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: passwordController,
          obscureText: _isVisible,
          autocorrect: false,
          enableSuggestions: false,
          decoration: InputDecoration(
              hintStyle: const TextStyle(fontSize: 12),
              suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  child: _isVisible
                      ? const Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        )
                      : const Icon(
                          Icons.visibility,
                          color: Colors.black,
                        )),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8))),
          validator: (password) {
            if (password != null && password.isEmpty) {
              return 'This field cannot be empty';
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }

  Widget elevatedButtonLogin() {
    return Container(
      width: MediaQuery.of(context).size.height,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(77, 137, 255, 18.5),
            Colors.blueAccent,
            Color(0xFF4D89FF)
          ])),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              primary: Colors.transparent,
              shadowColor: Colors.transparent),
          onPressed: () {
            if (!formKey.currentState!.validate()) return;
            formKey.currentState!.save();
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
        const Text(
          'Does\'t have account?',
          style: TextStyle(color: Colors.black87, fontSize: 12),
        ),
        TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const RegisterScreen()));
            },
            child: const Text(
              'Sign up',
              style: TextStyle(color: Color(0xFF4D89FF), fontSize: 12),
            ))
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
            const Text(
              'Remember Me',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              'Forgot password?',
              style: TextStyle(color: Colors.black87, fontSize: 12),
            ))
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
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(color: Colors.black)),
          color: Colors.white),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              primary: Colors.transparent,
              shadowColor: Colors.transparent),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.asset('assets/image/icon_google.png')),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Google',
                style: TextStyle(color: Colors.black),
              )
            ],
          )),
    );
  }
}
