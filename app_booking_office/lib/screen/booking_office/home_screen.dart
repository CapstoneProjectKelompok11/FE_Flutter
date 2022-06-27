import 'package:app_booking_office/property/home_screen/card_carosel.dart';
import 'package:app_booking_office/property/home_screen/drop_down_button.dart';
import 'package:app_booking_office/property/home_screen/form_search.dart';
import 'package:app_booking_office/property/home_screen/list_card_recommend.dart';
import 'package:app_booking_office/property/loading_screen.dart';
import 'package:app_booking_office/screen/booking_office/listing_screen.dart';
import 'package:app_booking_office/screen/booking_office/view_model/booking_office_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late BookingOfficeViewModel bookingOfficeViewModel;
  String? image;

  Future<void> initDataBuilding() async {
    Future.delayed(Duration.zero, () async {
      bookingOfficeViewModel =
          Provider.of<BookingOfficeViewModel>(context, listen: false);
      await bookingOfficeViewModel.getBuilding();
    });
  }

  Future<void> initDataBuildingById() async {
    Future.delayed(Duration.zero, () async {
      bookingOfficeViewModel =
          Provider.of<BookingOfficeViewModel>(context, listen: false);
      await bookingOfficeViewModel.getBuildingById('3');
    });
  }

  @override
  void initState() {
    super.initState();
    initDataBuilding();
    initDataBuildingById();
  }

  @override
  Widget build(BuildContext context) {
    bookingOfficeViewModel = Provider.of<BookingOfficeViewModel>(context);
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      CupertinoIcons.bell_fill,
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
                const CardCarosel(),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
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
                            'Tanah Abang',
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
