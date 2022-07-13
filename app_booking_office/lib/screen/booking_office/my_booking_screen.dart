import 'package:app_booking_office/property/my_booking_screen/button_status.dart';
import 'package:app_booking_office/screen/booking_office/view_model/booking_office_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBookingScreen extends StatefulWidget {
  MyBookingScreen({Key? key}) : super(key: key);

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  late BookingOfficeViewModel bookingOfficeViewModel;

  Future<void> initDataReservation() async {
    Future.delayed(Duration.zero, () async {
      bookingOfficeViewModel =
          Provider.of<BookingOfficeViewModel>(context, listen: false);
      await bookingOfficeViewModel.getReservation();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDataReservation();
  }

  @override
  Widget build(BuildContext context) {
    bookingOfficeViewModel = Provider.of<BookingOfficeViewModel>(context);
    return Scaffold(
        backgroundColor: const Color(0xFFF4F4F4),
        appBar: appBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: bookingOfficeViewModel.dataReservation.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          picture(index),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                title(index),
                                const SizedBox(
                                  height: 5,
                                ),
                                location(index),
                                const SizedBox(
                                  height: 5,
                                ),
                                typeFloor(index),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    bookingDate(index),
                                    ButtonStatus1()
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ));
  }

  Widget picture(int index) {
    return Container(
      width: 84,
      height: 84,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: NetworkImage(
                  'http://ec2-18-206-213-94.compute-1.amazonaws.com/api/building/image/${bookingOfficeViewModel.dataReservation[index].building.images[0].fileName}'),
              fit: BoxFit.cover)),
    );
  }

  Widget title(int index) {
    return Text(
      bookingOfficeViewModel.dataReservation[index].building.name,
      maxLines: 2,
      style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis),
    );
  }

  Widget location(int index) {
    return Row(
      children: [
        const Icon(
          Icons.location_on,
          color: Color(0xFF4D89FF),
          size: 10,
        ),
        Text(
          bookingOfficeViewModel.building[index].address.isNotEmpty
              ? bookingOfficeViewModel.building[index].address
              : '',
          maxLines: 2,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 7,
              overflow: TextOverflow.ellipsis),
        )
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFFF4F4F4),
      leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            CupertinoIcons.arrow_left,
            color: Colors.black,
            size: 30,
          )),
      centerTitle: true,
      title: const Text(
        'My Booking',
        style: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget typeFloor(int index) {
    return Text(
      bookingOfficeViewModel.dataReservation[index].floor.name,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
    );
  }

  Widget bookingDate(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Booking Date',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Icon(
              CupertinoIcons.calendar,
              color: Colors.black,
              size: 10,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              bookingOfficeViewModel.dataReservation[index].startReservation,
              style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w500),
            ),
          ],
        )
      ],
    );
  }
}
