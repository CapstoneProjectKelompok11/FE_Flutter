import 'package:app_booking_office/screen/auth/login_screen.dart';
import 'package:app_booking_office/screen/auth/model/auth_model.dart';
import 'package:app_booking_office/screen/auth/otp_authentication_screen.dart';
import 'package:app_booking_office/screen/auth/view_model/auth_view_model.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
  final formKey = GlobalKey<FormState>();
  bool _isVisible = false;

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
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buttonBack(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      'Getting started',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(child: Text('Create account to continue')),
                  const SizedBox(
                    height: 15,
                  ),
                  buttonGoogleSignIn(),
                  const SizedBox(
                    height: 15,
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
                    height: 25,
                  ),
                  //ini adalah tombol untuk menekan register
                  elevatedButtonRegister(),
                  const SizedBox(
                    height: 10,
                  ),
                  textButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textFormFieldFirstName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Firstname'),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: firstNameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }

  Widget textFormFieldLastName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Lastname'),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: lastNameNameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        )
      ],
    );
  }

  Widget textFormFieldPhone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Phone'),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: phoneController,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        )
      ],
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
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          validator: (email) {
            if (email != null && !EmailValidator.validate(email)) {
              return "Enter valid email!";
            }
          },
        )
      ],
    );
  }

  Widget textFormFieldPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Password'),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  child: _isVisible
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
            validator: (password) {
              if (password != null && password.length < 8) {
                return "Enter at least 8 characters";
              }
            })
      ],
    );
  }

  Widget elevatedButtonRegister() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          onPressed: () {
            //ini untuk menjalankan fungsi register dan mengirimkan data kepada model yang telah dibuat pada folder model
            authProvider.register(Auth(
                firstName: firstNameController.text,
                lastName: lastNameNameController.text,
                phone: phoneController.text,
                email: emailController.text,
                password: passwordController.text));
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const OtpScreen()));
          },
          child: const Text('Sign up')),
    );
  }

  Widget textButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Have an account?'),
        TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()));
            },
            child: const Text('Sign in'))
      ],
    );
  }

  Widget buttonBack() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
      child: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const LoginScreen()));
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          )),
    );
  }

  Widget buttonGoogleSignIn() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          onPressed: () {}, child: const Text('Sign in with google')),
    );
  }
}
