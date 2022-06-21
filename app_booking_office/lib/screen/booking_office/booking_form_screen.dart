import 'package:app_booking_office/property/bottom_navigation_bar.dart';
import 'package:app_booking_office/screen/booking_office/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingFormScreen extends StatefulWidget {
  BookingFormScreen({Key? key}) : super(key: key);

  @override
  State<BookingFormScreen> createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends State<BookingFormScreen> {
  List<String> items = ['item1', 'item2', 'item3', 'item4'];
  String selectedItem = 'item1';
  List<String> itemParticipant = ['0', '1', '2', '4', '5'];
  DateTime date = DateTime.now();
  final formKey = GlobalKey<FormState>();

  String selectedParticipant = '0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F4F4),
        centerTitle: true,
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
          'Request Booking',
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                dropDownTypeOffice(),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 72,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      startBooking(),
                      const SizedBox(
                        width: 10,
                      ),
                      dropDownParticipant(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                formCompanyName(),
                const SizedBox(
                  height: 10,
                ),
                formPhoneNumber(),
                const SizedBox(
                  height: 10,
                ),
                formNotes(),
                const SizedBox(
                  height: 30,
                ),
                buttonRequestBooking(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dropDownTypeOffice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Type Office',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        DropdownButtonFormField(
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey, width: 2)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black, width: 2))),
          value: selectedItem,
          items: items
              .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                  )))
              .toList(),
          onChanged: (item) {
            selectedItem = item.toString();
          },
        )
      ],
    );
  }

  Widget startBooking() {
    return Flexible(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Start Booking',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          readOnly: true,
          onTap: () async {
            var pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100));
            setState(() {
              date = pickedDate!;
            });
          },
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
                  borderRadius: BorderRadius.circular(8)),
              hintText: '${date.day}/${date.month}/${date.year}',
              hintStyle: const TextStyle(
                fontSize: 12,
              ),
              suffixIcon: const Icon(
                Icons.date_range_outlined,
                color: Colors.black,
              )),
        )
      ],
    ));
  }

  Widget dropDownParticipant() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Participant',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          DropdownButtonFormField(
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2))),
              value: selectedParticipant,
              items: itemParticipant
                  .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item.toString(),
                        style:
                            const TextStyle(fontSize: 12, color: Colors.black),
                      )))
                  .toList(),
              onChanged: (item) {
                selectedParticipant = item.toString();
              })
        ],
      ),
    );
  }

  Widget formCompanyName() {
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
          decoration: InputDecoration(
              hintText: 'Your compeny name here',
              hintStyle: const TextStyle(fontSize: 12),
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

  Widget formPhoneNumber() {
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
          decoration: InputDecoration(
              hintText: '08xx xxx xxx',
              hintStyle: const TextStyle(fontSize: 12),
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
          validator: (phone) {
            if (phone != null && phone.isEmpty) {
              return 'Phone number must not be empty';
            } else if (phone != null && phone.length < 9) {
              return 'Phone number must be more than 9 character';
            } else if (phone != null && phone.length > 15) {
              return 'Phone number must less than 15 characters';
            } else {
              return null;
            }
          },
        )
      ],
    );
  }

  Widget formNotes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Notes',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          maxLines: 8,
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
          validator: (note) {
            if (note != null && note.isEmpty) {
              return 'Note must be not empty';
            } else {
              return null;
            }
          },
        )
      ],
    );
  }

  Widget buttonRequestBooking() {
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
            //ini untuk menjalankan fungsi register dan mengirimkan data kepada model yang telah dibuat pada folder model
          },
          child: const Text('Request Booking')),
    );
  }
}
