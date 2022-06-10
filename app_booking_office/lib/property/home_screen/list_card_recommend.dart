import 'package:app_booking_office/model/book_office_model.dart';
import 'package:app_booking_office/screen/booking_office/detail_screen.dart';
import 'package:app_booking_office/screen/booking_office/view_model/booking_office_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCardRecommend extends StatefulWidget {
  const ListCardRecommend({Key? key}) : super(key: key);

  @override
  State<ListCardRecommend> createState() => _ListCardRecommendState();
}

class _ListCardRecommendState extends State<ListCardRecommend> {
  late BookingOfficeViewModel bookingOfficeViewModel;
  @override
  Widget build(BuildContext context) {
    bookingOfficeViewModel = Provider.of<BookingOfficeViewModel>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: bookingOfficeViewModel.offices.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DetailScreen(
                            picture:
                                bookingOfficeViewModel.offices[index].picture,
                            title: bookingOfficeViewModel.offices[index].name,
                            price: bookingOfficeViewModel.offices[index].price
                                .toString(),
                            location:
                                bookingOfficeViewModel.offices[index].location,
                            description: bookingOfficeViewModel
                                .offices[index].desciption)));
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      picture(index),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          price(index),
                          const SizedBox(
                            height: 5,
                          ),
                          title(index),
                          const SizedBox(
                            height: 5,
                          ),
                          location(index),
                          const SizedBox(
                            height: 5,
                          ),
                          rating(),
                          const SizedBox(
                            height: 5,
                          ),
                          rowDetail(index),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget picture(int index) {
    return Container(
      width: 84,
      height: 84,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image:
                  NetworkImage(bookingOfficeViewModel.offices[index].picture),
              fit: BoxFit.cover)),
    );
  }

  Widget price(int index) {
    return Row(
      children: [
        Text(
          '\$' + bookingOfficeViewModel.offices[index].price,
          maxLines: 1,
          style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF4D89FF),
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.bold),
        ),
        const Text(
          '/Month',
          maxLines: 1,
          style: TextStyle(
            fontSize: 12,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }

  Widget title(int index) {
    return Container(
      width: 200,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Text(
        bookingOfficeViewModel.offices[index].name,
        maxLines: 2,
        style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis),
      ),
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
          width: 180,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Text(
            bookingOfficeViewModel.offices[index].location,
            maxLines: 2,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 7,
                overflow: TextOverflow.ellipsis),
          ),
        )
      ],
    );
  }

  Widget rating() {
    return Row(
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
        Text(
          '(120) Review',
          style: TextStyle(fontSize: 4),
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
}
