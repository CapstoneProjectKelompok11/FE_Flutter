import 'package:app_booking_office/property/bottom_navigation_bar.dart';
import 'package:app_booking_office/screen/booking_office/view_model/booking_office_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import 'detail_screen.dart';

class SearchScreen1 extends StatefulWidget {
  SearchScreen1({Key? key}) : super(key: key);

  @override
  State<SearchScreen1> createState() => _SearchScreen1State();
}

class _SearchScreen1State extends State<SearchScreen1> {
  TextEditingController searchController = TextEditingController();
  late BookingOfficeViewModel bookingOfficeViewModel;

  Future<void> getResultSearch() async {
    Future.delayed(Duration.zero, () async {
      bookingOfficeViewModel =
          Provider.of<BookingOfficeViewModel>(context, listen: false);
      await bookingOfficeViewModel.searchBuilding(searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    bookingOfficeViewModel = Provider.of<BookingOfficeViewModel>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonBack(),
                    const SizedBox(
                      width: 10,
                    ),
                    searchField()
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                resultScreen()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget searchField() {
    return Flexible(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: TextFormField(
          controller: searchController,
          style: const TextStyle(fontSize: 12),
          onChanged: (value) {
            bookingOfficeViewModel
                .searchBuilding(searchController.text)
                .then((value) => getResultSearch());
          },
          decoration: InputDecoration(
              hintStyle: const TextStyle(fontSize: 12),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              hintText: 'Find location, or name a place',
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: Colors.black,
                size: 30,
              )),
        ),
      ),
    );
  }

  Widget buttonBack() {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const BottomNavBar()));
      },
      child: const Icon(
        CupertinoIcons.arrow_left,
        size: 30,
      ),
    );
  }

  Widget resultScreen() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: bookingOfficeViewModel.resultSearch.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => DetailScreen(
                          id: bookingOfficeViewModel.resultSearch[index].id
                              .toString(),
                          picture:
                              'http://ec2-18-206-213-94.compute-1.amazonaws.com/api/building/image/${bookingOfficeViewModel.resultSearch[index].images[0].fileName}',
                          title:
                              bookingOfficeViewModel.resultSearch[index].name,
                          price: 3444.toString(),
                          location: bookingOfficeViewModel
                              .resultSearch[index].address,
                          description: bookingOfficeViewModel
                              .resultSearch[index].description)));
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
                  ? 'http://ec2-18-206-213-94.compute-1.amazonaws.com/api/building/image/${bookingOfficeViewModel.resultSearch[index].images[0].fileName}'
                  : 'https://6.viki.io/image/794f78782da94d6799fd3cd978e50e96/dummy.jpeg?s=900x600&e=t'),
              fit: BoxFit.cover)),
    );
  }

  Widget title(int index) {
    return Container(
      width: 200,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Text(
        bookingOfficeViewModel.resultSearch[index].name,
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
            bookingOfficeViewModel.resultSearch[index].address,
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
        initialRating: bookingOfficeViewModel.resultSearch[index].rating,
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
                bookingOfficeViewModel.resultSearch[index].capacity.toString(),
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
                  bookingOfficeViewModel.resultSearch[index].floorCount
                      .toString(),
                  style: const TextStyle(fontSize: 8))
            ],
          ),
        ),
      ],
    );
  }
}
