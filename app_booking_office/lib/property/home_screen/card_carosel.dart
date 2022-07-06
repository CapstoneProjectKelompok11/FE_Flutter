import 'package:app_booking_office/model/book_office_model.dart';
import 'package:app_booking_office/screen/booking_office/detail_screen.dart';
import 'package:app_booking_office/screen/booking_office/listing_screen.dart';
import 'package:app_booking_office/screen/booking_office/view_model/booking_office_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardCarosel extends StatefulWidget {
  const CardCarosel({
    Key? key,
  }) : super(key: key);

  @override
  State<CardCarosel> createState() => _CardCaroselState();
}

class _CardCaroselState extends State<CardCarosel> {
  late BookingOfficeViewModel bookingOfficeViewModel;

  @override
  Widget build(BuildContext context) {
    bookingOfficeViewModel = Provider.of<BookingOfficeViewModel>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Top Places',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              buttonViewMore(),
            ],
          ),
        ),
        SizedBox(
          height: 160,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 20, right: 10),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              ListingScreen(id: complexCarosel[index].id)));
                },
                //card
                child: Container(
                  padding: const EdgeInsets.all(8),
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      picture(index),
                      const SizedBox(
                        height: 5,
                      ),
                      title(index),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
    ;
  }

  Widget picture(int index) {
    return Expanded(
      child: Container(
        width: 125,
        height: 77,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: NetworkImage(complexCarosel[index].image),
                fit: BoxFit.cover)),
      ),
    );
  }

  Widget title(int index) {
    return Text(
      complexCarosel[index].title,
      maxLines: 1,
      style: const TextStyle(
          fontSize: 11,
          color: Colors.black,
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
        Container(
          width: 100,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Text(
            bookingOfficeViewModel.building[index].address,
            maxLines: 1,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 8,
                overflow: TextOverflow.ellipsis),
          ),
        )
      ],
    );
  }

  Widget rowDetail(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          width: 38,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[200],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.groups_rounded,
                color: Colors.black,
                size: 15,
              ),
              Text(
                bookingOfficeViewModel.building[index].capacity.toString(),
                style: const TextStyle(fontSize: 8),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 5),
          width: 38,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[200],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.man,
                color: Colors.black,
                size: 15,
              ),
              Text('29',
                  style: const TextStyle(
                      fontSize: 8, overflow: TextOverflow.ellipsis))
            ],
          ),
        ),
        Container(
          width: 38,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[200],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.stairs,
                color: Colors.black,
                size: 15,
              ),
              Text('40', style: const TextStyle(fontSize: 8))
            ],
          ),
        ),
      ],
    );
  }

  Widget buttonViewMore() {
    return TextButton(
        onPressed: () {},
        child: const Text(
          'View More',
          style: TextStyle(
              color: Color(0xFF4D89FF),
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ));
  }
}
