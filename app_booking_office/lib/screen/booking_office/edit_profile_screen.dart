import 'package:app_booking_office/screen/booking_office/view_model/booking_office_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late BookingOfficeViewModel bookingOfficeViewModel;

  Future<void> getDataUser() async {
    Future.delayed(const Duration(seconds: 1), () async {
      bookingOfficeViewModel =
          Provider.of<BookingOfficeViewModel>(context, listen: false);
      await bookingOfficeViewModel.getUserData();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataUser();
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    companyNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bookingOfficeViewModel = Provider.of<BookingOfficeViewModel>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFF4F4F4),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            CupertinoIcons.arrow_left,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  previewProfileImage(bookingOfficeViewModel),
                  buttonPickImage(bookingOfficeViewModel),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  firstName(),
                  const SizedBox(
                    width: 10,
                  ),
                  lastName(),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              phoneNumber(),
              const SizedBox(
                height: 10,
              ),
              email(),
              // const SizedBox(
              //   height: 10,
              // ),
              // companyName(),
              const SizedBox(
                height: 40,
              ),
              buttonSave(),
            ],
          ),
        ),
      ),
    );
  }

  Widget firstName() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'FirstName',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            initialValue: bookingOfficeViewModel.userData.firstName,
            style: const TextStyle(fontSize: 12),
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey, width: 2)),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(8)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(8))),
            validator: (firstName) {
              if (firstName != null && firstName.isEmpty) {
                return 'firstName must not be empty';
              } else {
                return null;
              }
            },
          )
        ],
      ),
    );
  }

  Widget lastName() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'FirstName',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            initialValue: bookingOfficeViewModel.userData.lastName,
            style: const TextStyle(fontSize: 12),
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey, width: 2)),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(8)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(8))),
            validator: (lastName) {
              if (lastName != null && lastName.isEmpty) {
                return 'lastName must not be empty';
              } else {
                return null;
              }
            },
          )
        ],
      ),
    );
  }

  Widget phoneNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Phone Number',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          initialValue: bookingOfficeViewModel.userData.phone,
          style: const TextStyle(fontSize: 12),
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black, width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey, width: 2)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8))),
          validator: (phoneNumber) {
            if (phoneNumber != null && phoneNumber.isEmpty) {
              return 'Phone number must not be empty';
            } else {
              return null;
            }
          },
        )
      ],
    );
  }

  Widget email() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          initialValue: bookingOfficeViewModel.userData.email,
          style: const TextStyle(fontSize: 12),
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black, width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey, width: 2)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8))),
          validator: (email) {
            if (email != null && email.isEmpty) {
              return 'Email must not be empty';
            } else {
              return null;
            }
          },
        )
      ],
    );
  }

  Widget companyName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Company Name',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          initialValue: bookingOfficeViewModel.userData.firstName,
          style: const TextStyle(fontSize: 12),
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black, width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey, width: 2)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8))),
          validator: (companyName) {
            if (companyName != null && companyName.isEmpty) {
              return 'Company name must not be empty';
            } else {
              return null;
            }
          },
        )
      ],
    );
  }

  Widget buttonSave() {
    return Container(
      width: MediaQuery.of(context).size.width,
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
            bookingOfficeViewModel
                .postProfilePicture(bookingOfficeViewModel.image!)
                .then((value) => getDataUser());
            Navigator.pop(context);
          },
          child: const Text('Save')),
    );
  }

  Widget previewProfileImage(BookingOfficeViewModel bookingOfficeViewModel) {
    return SizedBox(
      width: 76,
      height: 76,
      child: ClipOval(
        child: bookingOfficeViewModel.userData.image != null
            ? Image.network(
                'http://ec2-18-206-213-94.compute-1.amazonaws.com/api/profile/image/${bookingOfficeViewModel.userData.image}',
                fit: BoxFit.cover,
              )
            : Image.network(
                'https://180dc.org/wp-content/uploads/2018/05/empty.png'),
      ),
    );
  }

  Widget buttonPickImage(BookingOfficeViewModel bookingOfficeViewModel) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: InkWell(
        onTap: () {
          bookingOfficeViewModel
              .pickImageGallery()
              .whenComplete(() => getDataUser());
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color(0xFF4D89FF),
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Icon(
            CupertinoIcons.photo_camera_solid,
            color: Colors.white,
            size: 10,
          ),
        ),
      ),
    );
  }
}
