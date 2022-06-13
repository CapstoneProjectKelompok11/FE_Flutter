import 'package:app_booking_office/property/search_screen/button_back.dart';
import 'package:app_booking_office/property/search_screen/button_categorise.dart';
import 'package:app_booking_office/property/search_screen/list_card_result.dart';
import 'package:app_booking_office/property/search_screen/search_field.dart';
import 'package:app_booking_office/property/search_screen/text_result.dart';

import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
                const ListCardResult(),
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
