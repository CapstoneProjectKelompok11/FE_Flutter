import 'package:app_booking_office/screen/booking_office/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import 'package:app_booking_office/model/book_office_model.dart';
import 'package:app_booking_office/property/search_screen/button_favorite.dart';
import 'package:app_booking_office/screen/booking_office/view_model/booking_office_view_model.dart';

class ListCardResult extends StatefulWidget {
  String id;
  ListCardResult({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ListCardResult> createState() => _ListCardResultState();
}

class _ListCardResultState extends State<ListCardResult> {
  late BookingOfficeViewModel bookingOfficeViewModel;
  Future<void> initDataBuildingByComplex() async {
    Future.delayed(const Duration(milliseconds: 2), () async {
      bookingOfficeViewModel =
          Provider.of<BookingOfficeViewModel>(context, listen: false);
      await bookingOfficeViewModel.getBuildingById(widget.id, '');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDataBuildingByComplex();
  }

  @override
  Widget build(BuildContext context) {
    bookingOfficeViewModel = Provider.of<BookingOfficeViewModel>(context);
    final isLoading =
        bookingOfficeViewModel.states == BookOfficeViewState.loading;
    final isError = bookingOfficeViewModel.states == BookOfficeViewState.error;
    if (isLoading) {
      return Center(
        child: LoadingAnimationWidget.stretchedDots(
            color: const Color(0xFF4D89FF), size: 50),
      );
    }
    if (isError) {
      return const Center(
        child: Text('Something wrong :('),
      );
    }
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
                            id: widget.id,
                            picture:
                                'http://ec2-18-206-213-94.compute-1.amazonaws.com/api/building/image/${bookingOfficeViewModel.buildingById[index].images[0].fileName}',
                            title:
                                bookingOfficeViewModel.buildingById[index].name,
                            description: bookingOfficeViewModel
                                .buildingById[index].description,
                            location: bookingOfficeViewModel
                                .buildingById[index].address,
                          )));
            },
            child: Container(
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
                              children: [title(index), rowDetail(index)],
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
            ),
          );
        });
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
    return const Text(
      '\$ 7000000',
      maxLines: 1,
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 13,
          overflow: TextOverflow.ellipsis),
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

  Widget location(int index) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 40),
        child: Text(
          bookingOfficeViewModel.buildingById[index].address,
          maxLines: 2,
          style: const TextStyle(
              color: Colors.grey, fontSize: 9, overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }

  Widget title(int index) {
    return Expanded(
      child: Text(bookingOfficeViewModel.buildingById[index].name,
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
                bookingOfficeViewModel.buildingById[index].capacity.toString(),
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
                      .toString(),
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
              image: NetworkImage(
                  'http://ec2-18-206-213-94.compute-1.amazonaws.com/api/building/image/${bookingOfficeViewModel.buildingById[index].images[0].fileName}'),
              fit: BoxFit.cover)),
    );
  }
}
