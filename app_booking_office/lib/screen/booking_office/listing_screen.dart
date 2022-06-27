import 'package:app_booking_office/property/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_booking_office/property/search_screen/button_back.dart';
import 'package:app_booking_office/property/search_screen/button_categorise.dart';
import 'package:app_booking_office/property/search_screen/list_card_result.dart';
import 'package:app_booking_office/property/search_screen/search_field.dart';
import 'package:app_booking_office/property/search_screen/text_result.dart';
import 'package:app_booking_office/screen/booking_office/view_model/booking_office_view_model.dart';

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
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                appBar(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SearchField(),
                    ButtonCategorize(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListCardResult(
                  id: widget.id,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        ButtonBack(),
        TextResult(),
        Icon(
          Icons.settings_outlined,
          color: Colors.black,
          size: 30,
        )
      ],
    );
  }
}
