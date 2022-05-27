import 'package:app_booking_office/screen/auth/login_screen.dart';
import 'package:app_booking_office/screen/auth/model/auth_model.dart';
import 'package:app_booking_office/screen/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late AuthViewModel authProvider;

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              ))),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Register',
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //ini adalah form untuk pengisian firstName
                  textFormFieldFirstName(),
                  const SizedBox(
                    height: 10,
                  ),
                  //ini adalah form untuk pengisian lastName
                  textFormFieldLastName(),
                  const SizedBox(
                    height: 10,
                  ),
                  //ini adalah form untuk pengisian phone
                  textFormFieldPhone(),
                  const SizedBox(
                    height: 10,
                  ),
                  //ini adalah form pengisian untuk email
                  textFormFieldEmail(),
                  const SizedBox(
                    height: 10,
                  ),
                  //ini adalah form untuk pengisian password
                  textFormFieldPassword(),
                  const SizedBox(
                    height: 15,
                  ),
                  //ini adalah tombol untuk menekan register
                  elevatedButtonRegister(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textFormFieldFirstName() {
    return TextFormField(
      controller: firstNameController,
      decoration: InputDecoration(
        labelText: 'Firstname',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget textFormFieldLastName() {
    return TextFormField(
      controller: lastNameNameController,
      decoration: InputDecoration(
        labelText: 'Lastname',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget textFormFieldPhone() {
    return TextFormField(
      controller: phoneController,
      decoration: InputDecoration(
        labelText: 'phone',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget textFormFieldEmail() {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget textFormFieldPassword() {
    return TextFormField(
      controller: passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget elevatedButtonRegister() {
    return ElevatedButton(
        onPressed: () {
          //ini untuk menjalankan fungsi register dan mengirimkan data kepada model yang telah dibuat pada folder model
          authProvider.register(Auth(
              firstName: firstNameController.text,
              lastName: lastNameNameController.text,
              phone: phoneController.text,
              email: emailController.text,
              password: passwordController.text));
        },
        child: const Text('Register'));
  }
}
