import 'package:app_booking_office/property/favorite_screen/empty_favorite_screen.dart';
import 'package:app_booking_office/screen/booking_office/detail_screen.dart';
import 'package:app_booking_office/screen/booking_office/view_model/booking_office_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../property/loading_screen.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late BookingOfficeViewModel bookingOfficeViewModel;

  Future<void> getFavorite() async {
    Future.delayed(const Duration(seconds: 1), () async {
      bookingOfficeViewModel =
          Provider.of<BookingOfficeViewModel>(context, listen: false);
      await bookingOfficeViewModel.getFavorite(context);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFavorite();
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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFF4F4F4),
        elevation: 0,
        title: const Text(
          'Favorite',
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: bookingOfficeViewModel.dataFavorite.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: listFavorite(),
            )
          : EmptyFavoriteScreen(),
    );
  }

  Widget listFavorite() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: bookingOfficeViewModel.dataFavorite.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => DetailScreen(
                          id: bookingOfficeViewModel
                              .dataFavorite[index].building.id
                              .toString(),
                          picture:
                              'http://ec2-18-206-213-94.compute-1.amazonaws.com/api/building/image/${bookingOfficeViewModel.dataFavorite[index].building.images[0].fileName}',
                          title: bookingOfficeViewModel
                              .dataFavorite[index].building.name,
                          price: 3444.toString(),
                          location: bookingOfficeViewModel
                              .dataFavorite[index].building.address,
                          description: bookingOfficeViewModel
                              .dataFavorite[index].building.description)));
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            bookingOfficeViewModel
                                .unFavorite(
                                    bookingOfficeViewModel
                                        .dataFavorite[index].building.id
                                        .toString(),
                                    context)
                                .whenComplete(() => getFavorite());
                          },
                          child: const Icon(
                            CupertinoIcons.delete,
                            size: 20,
                            color: Colors.red,
                          ),
                        )),
                    Row(
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
                            rowDetail(index),
                          ],
                        )
                      ],
                    ),
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
              image: NetworkImage(
                  'http://ec2-18-206-213-94.compute-1.amazonaws.com/api/building/image/${bookingOfficeViewModel.dataFavorite[index].building.images[0].fileName}'),
              fit: BoxFit.cover)),
    );
  }

  Widget title(int index) {
    return Container(
      width: 200,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Text(
        bookingOfficeViewModel.dataFavorite[index].building.name ?? 'null',
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
            bookingOfficeViewModel.dataFavorite[index].building.address ??
                "null",
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
        initialRating:
            bookingOfficeViewModel.dataFavorite[index].building.rating ?? 0,
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
                bookingOfficeViewModel.dataFavorite[index].building.capacity
                    .toString(),
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
                  bookingOfficeViewModel.dataFavorite[index].building.floorCount
                      .toString(),
                  style: const TextStyle(fontSize: 8))
            ],
          ),
        ),
      ],
    );
  }
}
