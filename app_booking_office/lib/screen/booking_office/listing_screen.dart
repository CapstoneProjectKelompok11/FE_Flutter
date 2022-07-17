import 'package:app_booking_office/property/bottom_navigation_bar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:app_booking_office/property/search_screen/list_card_result.dart';

class ListingScreen extends StatefulWidget {
  String id;

  ListingScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ListingScreen> createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFF4F4F4),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const BottomNavBar()));
            },
            icon: const Icon(
              CupertinoIcons.arrow_left,
              color: Colors.black,
              size: 30,
            )),
        title: const Text(
          'Result',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          clipBehavior: Clip.antiAlias,
          child: ListCardResult(
            id: widget.id,
          ),
        ),
      ),
    );
  }
}
