import 'package:app_booking_office/screen/booking_office/confirmation_payment_screen.dart';
import 'package:flutter/material.dart';

class ButtonStatus1 extends StatefulWidget {
  String picture;
  String status;
  String idReservation;
  String? buildingTitle;
  String? address;
  String? participant;
  String? bookingId;
  String? buildingType;
  String? floor;
  String? sizeRoom;
  String? name;
  String? email;
  String? phone;
  String? companyName;
  String? bookingDate;
  String? dealPrice;
  String? totalPrice;
  ButtonStatus1(
      {Key? key,
      required this.picture,
      required this.status,
      required this.idReservation,
      required this.buildingTitle,
      required this.address,
      required this.participant,
      required this.bookingId,
      required this.buildingType,
      required this.floor,
      required this.sizeRoom,
      required this.name,
      required this.email,
      required this.phone,
      required this.companyName,
      required this.bookingDate,
      this.dealPrice,
      required this.totalPrice})
      : super(key: key);

  @override
  State<ButtonStatus1> createState() => _ButtonStatus1State();
}

class _ButtonStatus1State extends State<ButtonStatus1> {
  @override
  Widget build(BuildContext context) {
    return statusButton();
  }

  Widget statusButton() {
    if (widget.status == "WAITING") {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        decoration: ShapeDecoration(
          color: const Color(0xFFFBCD0A),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                primary: Colors.transparent,
                shadowColor: Colors.transparent),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ConfirmationPaymentScreen(
                          picture: widget.picture,
                          reservationId: widget.idReservation,
                          buildingTitle: widget.buildingTitle,
                          address: widget.address,
                          participant: widget.participant,
                          bookingId: widget.bookingId,
                          buildingType: widget.buildingType,
                          floor: widget.floor,
                          sizeRoom: widget.sizeRoom,
                          name: widget.name,
                          email: widget.email,
                          phone: widget.phone,
                          companyName: widget.companyName,
                          bookingDate: widget.bookingDate,
                          dealPrice: widget.dealPrice,
                          totalPrice: widget.totalPrice)));
            },
            child: const Text(
              'Confirm & pay',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            )),
      );
    }
    if (widget.status == "ACTIVE") {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        decoration: ShapeDecoration(
          color: const Color(0xFF25D366),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                primary: Colors.transparent,
                shadowColor: Colors.transparent),
            onPressed: () {},
            child: const Text(
              'Order Active',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            )),
      );
    }
    if (widget.status == "CANCELED") {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        decoration: ShapeDecoration(
          color: const Color(0xFFFF9292),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                primary: Colors.transparent,
                shadowColor: Colors.transparent),
            onPressed: () {},
            child: const Text(
              'Cancelled',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            )),
      );
    }
    if (widget.status == "PENDING") {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        decoration: ShapeDecoration(
          color: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                primary: Colors.transparent,
                shadowColor: Colors.transparent),
            onPressed: () {},
            child: const Text(
              'Pending',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            )),
      );
    }
    return Container();
  }
}
