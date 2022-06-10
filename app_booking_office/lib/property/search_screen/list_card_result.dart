import 'package:app_booking_office/model/book_office_model.dart';
import 'package:app_booking_office/property/search_screen/button_favorite.dart';
import 'package:app_booking_office/screen/booking_office/view_model/booking_office_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCardResult extends StatefulWidget {
  const ListCardResult({Key? key}) : super(key: key);

  @override
  State<ListCardResult> createState() => _ListCardResultState();
}

class _ListCardResultState extends State<ListCardResult> {
  late BookingOfficeViewModel bookingOfficeViewModel;
  @override
  Widget build(BuildContext context) {
    bookingOfficeViewModel = Provider.of<BookingOfficeViewModel>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: image.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        picture(index),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                title(index),
                                rowDetail(index),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.blue,
                                  size: 10,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                location(index),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            rating(index),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(top: 15, right: 15, child: ButtonFavorite())
                ],
              ),
            );
          }),
    );
  }

  Widget categorize() {
    return Container(
      height: 58,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black, width: 2)),
      child: ClipRect(
          child: Image.asset(
        'assets/icons/filter.png',
        color: Colors.black,
      )),
    );
  }

  Widget price(int index) {
    return Text(
      '\$${bookingOfficeViewModel.offices[index].price} ',
      maxLines: 1,
      style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 13,
          overflow: TextOverflow.ellipsis),
    );
  }

  Widget rating(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Icon(
              Icons.star,
              color: Color(0xFFFBCD0A),
              size: 10,
            ),
            SizedBox(
              width: 2,
            ),
            Icon(
              Icons.star,
              color: Color(0xFFFBCD0A),
              size: 10,
            ),
            SizedBox(
              width: 2,
            ),
            Icon(
              Icons.star,
              color: Color(0xFFFBCD0A),
              size: 10,
            ),
            SizedBox(
              width: 2,
            ),
            Icon(
              Icons.star,
              color: Color(0xFFFBCD0A),
              size: 10,
            ),
            SizedBox(
              width: 2,
            ),
            Icon(
              Icons.star,
              color: Color(0xFFFBCD0A),
              size: 10,
            ),
            SizedBox(
              width: 2,
            ),
          ],
        ),
        price(index),
      ],
    );
  }

  Widget location(int index) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 40),
        child: Text(
          bookingOfficeViewModel.offices[index].location,
          maxLines: 2,
          style: const TextStyle(
              color: Colors.grey, fontSize: 9, overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }

  Widget title(int index) {
    return Expanded(
      child: Text(bookingOfficeViewModel.offices[index].name,
          maxLines: 2,
          style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          )),
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
                bookingOfficeViewModel.offices[index].capacity.toString(),
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
              Text(bookingOfficeViewModel.offices[index].toilet.toString(),
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
              Text(bookingOfficeViewModel.offices[index].stairs.toString(),
                  style: const TextStyle(fontSize: 8))
            ],
          ),
        ),
      ],
    );
  }

  Widget picture(int index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image:
                  NetworkImage(bookingOfficeViewModel.offices[index].picture),
              fit: BoxFit.cover)),
    );
  }
}
