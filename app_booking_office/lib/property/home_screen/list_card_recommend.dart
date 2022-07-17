import 'package:app_booking_office/model/book_office_model.dart';
import 'package:app_booking_office/screen/booking_office/detail_screen.dart';
import 'package:app_booking_office/screen/booking_office/view_model/booking_office_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: bookingOfficeViewModel.buildingById.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => DetailScreen(
                          id: bookingOfficeViewModel.buildingById[index].id
                              .toString(),
                          picture:
                              'http://ec2-18-206-213-94.compute-1.amazonaws.com/api/building/image/${bookingOfficeViewModel.buildingById[index].images[0].fileName}',
                          title:
                              bookingOfficeViewModel.buildingById[index].name,
                          price: 3444.toString(),
                          location: bookingOfficeViewModel
                              .buildingById[index].address,
                          description: bookingOfficeViewModel
                              .buildingById[index].description)));
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
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
                        rating(index),
                        const SizedBox(
                          height: 5,
                        ),
                        rowDetail(index)
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget picture(int index) {
    return Container(
      width: 84,
      height: 84,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: NetworkImage(bookingOfficeViewModel
                      .buildingById[index].images[0].fileName.isNotEmpty
                  ? 'http://ec2-18-206-213-94.compute-1.amazonaws.com/api/building/image/${bookingOfficeViewModel.buildingById[index].images[0].fileName}'
                  : 'https://thumbs.dreamstime.com/b/transparent-designer-must-have-fake-background-39672616.jpg'),
              fit: BoxFit.cover)),
    );
  }

  Widget title(int index) {
    return Container(
      width: 200,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Text(
        bookingOfficeViewModel.buildingById[index].name.isNotEmpty
            ? bookingOfficeViewModel.buildingById[index].name
            : '',
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
            bookingOfficeViewModel.buildingById[index].address.isNotEmpty
                ? bookingOfficeViewModel.buildingById[index].address
                : '',
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

  Widget rating(int index) {
    return RatingBar.builder(
        minRating: 1,
        maxRating: 10,
        ignoreGestures: true,
        itemSize: 10,
        initialRating: bookingOfficeViewModel.buildingById[index].rating,
        itemBuilder: (context, index) {
          return const Icon(
            Icons.star_sharp,
            color: Colors.yellow,
            size: 10,
          );
        },
        onRatingUpdate: (rating) {});
  }

  Widget rowDetail(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          padding: const EdgeInsets.all(5),
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
              const SizedBox(
                width: 5,
              ),
              Text(
                bookingOfficeViewModel.buildingById[index].capacity
                        .toString()
                        .isNotEmpty
                    ? bookingOfficeViewModel.buildingById[index].capacity
                        .toString()
                    : '',
                style: const TextStyle(fontSize: 8),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
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
              const SizedBox(
                width: 5,
              ),
              Text(
                  bookingOfficeViewModel.buildingById[index].floorCount
                          .toString()
                          .isNotEmpty
                      ? bookingOfficeViewModel.buildingById[index].floorCount
                          .toString()
                      : '',
                  style: const TextStyle(fontSize: 8))
            ],
          ),
        ),
      ],
    );
  }
}
