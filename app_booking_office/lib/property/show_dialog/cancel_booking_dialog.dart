import 'package:app_booking_office/model/book_office_model.dart';
import 'package:app_booking_office/screen/booking_office/view_model/booking_office_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class CancelBookingDialog extends StatefulWidget {
  String reservationId;
  CancelBookingDialog({Key? key, required this.reservationId})
      : super(key: key);

  @override
  State<CancelBookingDialog> createState() => _CancelBookingDialogState();
}

class _CancelBookingDialogState extends State<CancelBookingDialog> {
  late BookingOfficeViewModel bookingOfficeViewModel;

  @override
  Widget build(BuildContext context) {
    bookingOfficeViewModel = Provider.of<BookingOfficeViewModel>(context);
    return AlertDialog(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(8)),
        title: Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Are you sure you wan to\ncancel this booking?',
                style: TextStyle(fontSize: 16, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buttonContinue(),
            const SizedBox(
              width: 10,
            ),
            buttonCancel(),
          ],
        ));
  }

  Widget buttonContinue() {
    return Expanded(
      child: Container(
        decoration: ShapeDecoration(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: Color(0xFFFF9292)),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                primary: Colors.transparent,
                shadowColor: Colors.transparent),
            onPressed: () async {
              await bookingOfficeViewModel
                  .cancelRequestBooking(widget.reservationId);
            },
            child: const Text(
              'Continue',
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }

  Widget buttonCancel() {
    return Expanded(
      child: Container(
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(color: Color(0xFFFF9292))),
              color: Colors.white),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ))),
    );
  }
}
