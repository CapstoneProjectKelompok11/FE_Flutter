import 'package:app_booking_office/screen/booking_office/chat_screen.dart';
import 'package:app_booking_office/screen/booking_office/my_booking_screen.dart';
import 'package:flutter/material.dart';

class BookingSucces extends StatelessWidget {
  String buildingId;
  BookingSucces({Key? key, required this.buildingId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(8)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Request Booking Succesfull!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Please send Message to admin to confirm booking',
            style: TextStyle(fontSize: 12, color: Color(0xFF868686)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const Icon(
            Icons.check_circle,
            size: 100,
            color: Colors.green,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.height,
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
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
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ChatScreen(
                                buildingId: buildingId,
                              )));
                },
                child: const Text(
                  'Message to Admin',
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
