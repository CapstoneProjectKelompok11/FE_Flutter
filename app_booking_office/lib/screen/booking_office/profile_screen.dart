import 'package:app_booking_office/screen/auth/view_model/auth_view_model.dart';
import 'package:app_booking_office/screen/booking_office/edit_profile_screen.dart';
import 'package:app_booking_office/screen/booking_office/view_model/booking_office_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final bookingOfficeViewModeel =
        Provider.of<BookingOfficeViewModel>(context);
    return Scaffold(
        backgroundColor: const Color(0xFFF4F4F4),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color(0xFFF4F4F4),
          automaticallyImplyLeading: false,
          title: const Text(
            'Profile',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  profilePicture(bookingOfficeViewModeel),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      nameProfile(),
                      const SizedBox(
                        height: 5,
                      ),
                      emailProfile(),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              editProfileButton(),
              const SizedBox(
                height: 20,
              ),
              buttonSettings(),
              const SizedBox(
                height: 20,
              ),
              buttonFaqs(),
              const SizedBox(
                height: 20,
              ),
              helpCentreButton(),
              const SizedBox(
                height: 20,
              ),
              buttonSignOut(authViewModel),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }

  Widget profilePicture(BookingOfficeViewModel bookingOfficeViewModel) {
    return SizedBox(
      width: 64,
      height: 64,
      child: ClipOval(
        child: bookingOfficeViewModel.image != null
            ? Image.file(
                bookingOfficeViewModel.image!,
                fit: BoxFit.cover,
              )
            : Image.network(
                'https://180dc.org/wp-content/uploads/2018/05/empty.png'),
      ),
    );
  }

  Widget nameProfile() {
    return const Text(
      'Nobody',
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    );
  }

  Widget emailProfile() {
    return const Text(
      'Nobody@gmail.com',
      style: TextStyle(color: Color(0xFF868686), fontSize: 12),
    );
  }

  Widget editProfileButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => EditProfileScreen()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(
                Icons.create_rounded,
                color: Colors.black,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Edit Profile',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget helpCentreButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(
                CupertinoIcons.question_circle_fill,
                color: Colors.black,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Help Centere',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buttonSignOut(AuthViewModel authViewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            authViewModel.logout(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(
                CupertinoIcons.square_arrow_right,
                color: Colors.black,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Sign Out',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buttonFaqs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(
                CupertinoIcons.ellipsis_circle_fill,
                color: Colors.black,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'FAQs',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buttonSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(
                CupertinoIcons.gear_alt_fill,
                color: Colors.black,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Settings',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
