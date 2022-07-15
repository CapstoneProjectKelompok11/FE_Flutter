import 'package:app_booking_office/model/book_office_model.dart';
import 'package:app_booking_office/screen/booking_office/view_model/booking_office_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../property/loading_screen.dart';

class BookingFormScreen extends StatefulWidget {
  List? office;
  String? buildingId;
  String? officeId;
  BookingFormScreen({Key? key, this.office, this.buildingId, this.officeId})
      : super(key: key);

  @override
  State<BookingFormScreen> createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends State<BookingFormScreen> {
  List<dynamic> itemParticipant = Iterable.generate(100).toList();

  void indexFloor() {
    for (var i = 0; i < bookingOfficeViewModel.floor.length; i++) {
      index = i;
    }
  }

  DateTime date = DateTime.now();
  DateTime time = DateTime.now();
  final formKey = GlobalKey<FormState>();
  int index = 0;
  String? selectedFloor;
  String? selectedParticipant;
  TextEditingController companyNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');
  DateFormat timeFormat = DateFormat('hh:mm:ss');
  late BookingOfficeViewModel bookingOfficeViewModel;

  Future<void> initListNameFloor() async {
    Future.delayed(Duration.zero, () async {
      final bookingOfficeViewModel =
          Provider.of<BookingOfficeViewModel>(context, listen: false);
      await bookingOfficeViewModel.getDataFloor(widget.buildingId!);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initListNameFloor();
  }

  @override
  Widget build(BuildContext context) {
    final bookingOfficeViewModel = Provider.of<BookingOfficeViewModel>(context);
    final isLoading =
        bookingOfficeViewModel.states == BookOfficeViewState.loading;
    final isError = bookingOfficeViewModel.states == BookOfficeViewState.error;
    if (isLoading) {
      return const LoadingScreen();
    }
    if (isError) {
      return const Center(
        child: Text('Something wrong :('),
      );
    }
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
                dropDownTypeOffice(bookingOfficeViewModel),
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
                buttonRequestBooking(bookingOfficeViewModel)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dropDownTypeOffice(BookingOfficeViewModel bookingOfficeViewModel) {
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
          hint: const Text(
            'Select type',
            style: TextStyle(fontSize: 12),
          ),
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey, width: 2)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black, width: 2))),
          items: bookingOfficeViewModel.nameFloor
              .map((value) => DropdownMenuItem(
                  value: value['name'],
                  child: Text(
                    value['name'],
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                  )))
              .toList(),
          onChanged: (item) {
            selectedFloor = item.toString();
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
            if (pickedDate == null) return;

            setState(() {
              date = pickedDate;
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
              hintText: dateFormat.format(date),
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
              hint: const Text(
                'Select Participant',
                style: TextStyle(fontSize: 12),
              ),
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
          controller: companyNameController,
          style: const TextStyle(fontSize: 12),
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
          controller: phoneNumberController,
          style: const TextStyle(fontSize: 12),
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
          controller: notesController,
          style: const TextStyle(fontSize: 12),
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

  Widget buttonRequestBooking(BookingOfficeViewModel bookingOfficeViewModel) {
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
            debugPrint(dateFormat.format(date) + " " + timeFormat.format(time));
            if (!formKey.currentState!.validate()) return;
            formKey.currentState!.save();
            bookingOfficeViewModel.postReservation(
                Reservation(
                    startReservation:
                        dateFormat.format(date) + " " + timeFormat.format(time),
                    company: companyNameController.text,
                    phone: phoneNumberController.text,
                    participant: selectedParticipant.toString(),
                    note: notesController.text),
                bookingOfficeViewModel.floor[index].id.toString(),
                context);
          },
          child: const Text('Request Booking')),
    );
  }
}
