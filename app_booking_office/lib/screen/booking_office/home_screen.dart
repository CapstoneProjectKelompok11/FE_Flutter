import 'package:app_booking_office/property/home_screen/card_carosel.dart';
import 'package:app_booking_office/property/home_screen/drop_down_button.dart';
import 'package:app_booking_office/property/home_screen/form_search.dart';
import 'package:app_booking_office/property/home_screen/list_card_recommend.dart';
import 'package:app_booking_office/screen/booking_office/search_screen.dart';
import 'package:app_booking_office/screen/booking_office/view_model/booking_office_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late BookingOfficeViewModel bookingOfficeViewModel;

  Future<void> initDataBuilding() async {
    Future.delayed(Duration.zero, () async {
      bookingOfficeViewModel =
          Provider.of<BookingOfficeViewModel>(context, listen: false);
      await bookingOfficeViewModel.getOffice();
    });
  }

  @override
  void initState() {
    super.initState();
    initDataBuilding();
  }

  @override
  Widget build(BuildContext context) {
    bookingOfficeViewModel = Provider.of<BookingOfficeViewModel>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SearchScreen()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Icon(
                      Icons.settings_outlined,
                      color: Colors.black,
                      size: 25,
                    ),
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
                CardCarosel(),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Recommendation',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Komplek 1',
                            style: TextStyle(fontSize: 12),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'View More',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF4D89FF),
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      const ListCardRecommend(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
