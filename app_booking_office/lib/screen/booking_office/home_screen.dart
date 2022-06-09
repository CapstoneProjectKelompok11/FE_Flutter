import 'package:app_booking_office/property/home_screen/card_carosel.dart';
import 'package:app_booking_office/property/home_screen/drop_down_button.dart';
import 'package:app_booking_office/property/home_screen/form_search.dart';
import 'package:app_booking_office/property/home_screen/list_card_recommend.dart';
import 'package:app_booking_office/screen/booking_office/search_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => SearchScreen()));
                  },
                  child: const Icon(
                    Icons.settings_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                const DropDownButton(),
                const SizedBox(
                  height: 18,
                ),
                SearchField(),
                const SizedBox(
                  height: 8,
                ),
                const CardCarosel(),
                const SizedBox(
                  height: 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recommendation',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Komplek 1'),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'View More',
                              style: TextStyle(
                                  color: Color(0xFF4D89FF),
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    ListCardRecommend(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
