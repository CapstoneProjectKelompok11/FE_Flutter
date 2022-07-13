import 'package:flutter/material.dart';

class ButtonStatus1 extends StatefulWidget {
  String status;
  ButtonStatus1({Key? key, required this.status}) : super(key: key);

  @override
  State<ButtonStatus1> createState() => _ButtonStatus1State();
}

class _ButtonStatus1State extends State<ButtonStatus1> {
  @override
  Widget build(BuildContext context) {
    return statusButton();
  }

  Widget statusButton() {
    if (widget.status == "WAITING" || widget.status == "PENDING") {
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
            onPressed: () {},
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
    return Container();
  }
}
