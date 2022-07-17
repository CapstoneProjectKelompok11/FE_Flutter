import 'dart:ui';

import 'package:app_booking_office/model/book_office_model.dart';
import 'package:app_booking_office/property/bottom_navigation_bar.dart';
import 'package:app_booking_office/property/loading_screen.dart';
import 'package:app_booking_office/property/show_dialog/cancel_booking_dialog.dart';
import 'package:app_booking_office/screen/booking_office/booking_form_screen.dart';
import 'package:app_booking_office/screen/booking_office/home_screen.dart';
import 'package:app_booking_office/screen/booking_office/view_model/booking_office_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class DetailScreen extends StatefulWidget {
  String? picture;
  String? title;
  String? price;
  String? location;
  String? description;
  String id;
  DetailScreen(
      {Key? key,
      this.picture,
      required this.id,
      this.title,
      this.price,
      this.location,
      this.description})
      : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isfavorite = true;
  double rating = 0;
  late BookingOfficeViewModel bookingOfficeViewModel;
  TextEditingController reviewController = TextEditingController();
  int index = 0;

  void indexOffice() {
    for (var i = 0; i < bookingOfficeViewModel.floor.length; i++) {
      index = i;
    }
  }

  Future<void> getFavorite() async {
    Future.delayed(const Duration(seconds: 1), () async {
      bookingOfficeViewModel =
          Provider.of<BookingOfficeViewModel>(context, listen: false);
      await bookingOfficeViewModel.getFavorite(context);
    });
  }

  Future<void> getDataFloor() async {
    Future.delayed(Duration.zero, () async {
      bookingOfficeViewModel =
          Provider.of<BookingOfficeViewModel>(context, listen: false);
      await bookingOfficeViewModel.getFloor(widget.id);
    });
  }

  Future<void> getDataReview() async {
    Future.delayed(Duration.zero, () async {
      bookingOfficeViewModel =
          Provider.of<BookingOfficeViewModel>(context, listen: false);
      await bookingOfficeViewModel.getReview(widget.id);
    });
  }

  @override
  void initState() {
    super.initState();
    getDataFloor();
    getDataReview();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    reviewController.dispose();
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
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              appBar(),
              const SizedBox(
                height: 15,
              ),
              picture(),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  title(),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              location(),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'About',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              textDEscription(),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Type Office',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              listType(),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Reviews',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  writeReview(),
                  const SizedBox(width: 10),
                  buttonSendReview(context),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              listReview()
            ],
          ),
        ),
      )),
    );
  }

  Widget appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            CupertinoIcons.arrow_left,
            color: Colors.black,
            size: 30,
          ),
        ),
        const Text(
          'Details',
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        buttonFavorite(),
      ],
    );
  }

  Widget picture() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 171,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
            image: widget.picture != null
                ? NetworkImage(widget.picture!)
                : const NetworkImage(
                    'https://image.shutterstock.com/image-vector/404-error-page-funny-design-260nw-1761026456.jpg'),
            fit: BoxFit.cover),
      ),
    );
  }

  Widget location() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.location_on,
          color: Colors.blue,
          size: 15,
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 80),
            child: widget.location != null
                ? Text(
                    widget.location!,
                    maxLines: 2,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis),
                  )
                : const Text('null'),
          ),
        ),
      ],
    );
  }

  Widget title() {
    return widget.title != null
        ? Flexible(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                widget.title != null ? widget.title! : 'null',
                maxLines: 2,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          )
        : const Text('null');
  }

  Widget textDEscription() {
    return widget.description != null
        ? ReadMoreText(
            widget.description!,
            trimLines: 5,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Read More',
            trimExpandedText: 'Read less',
            lessStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
            moreStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          )
        : const Text('null');
  }

  Widget elevatedButtonBookNow(int index) {
    return Container(
      width: MediaQuery.of(context).size.height,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(77, 137, 255, 18.5),
            Colors.blueAccent,
            Color(0xFF4D89FF)
          ])),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              primary: Colors.transparent,
              shadowColor: Colors.transparent),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => BookingFormScreen(
                          officeId:
                              bookingOfficeViewModel.floor[index].id.toString(),
                          buildingId: widget.id,
                          office: bookingOfficeViewModel.floor,
                        )));
          },
          child: const Text('Book Now')),
    );
  }

  Widget buttonFavorite() {
    return InkWell(
      onTap: () async {
        await bookingOfficeViewModel
            .addFavorite(widget.id, context)
            .then((_) => getFavorite());
        setState(() {
          _isfavorite = !_isfavorite;
        });
      },
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white),
        child: _isfavorite
            ? const Icon(
                Icons.favorite_border_sharp,
                color: Colors.black,
                size: 18,
              )
            : const Icon(
                Icons.favorite_rounded,
                color: Colors.redAccent,
                size: 18,
              ),
      ),
    );
  }

  Widget listType() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: bookingOfficeViewModel.floor.length,
        itemBuilder: (index, context) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                color: const Color(0xFFF8F8F8),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 10, bottom: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 89,
                        height: 89,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(bookingOfficeViewModel
                                            .floor[context].image !=
                                        null
                                    ? 'http://ec2-18-206-213-94.compute-1.amazonaws.com/api/floor/image/${bookingOfficeViewModel.floor[context].image}'
                                    : 'https://previews.123rf.com/images/latkun/latkun1712/latkun171200130/92172856-empty-transparent-background-seamless-pattern.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bookingOfficeViewModel.floor[context].name ?? '',
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            rowDetail(context),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp. ',
                                  ).format(int.parse(bookingOfficeViewModel
                                      .floor[context].startingPrice
                                      .toString())),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 1),
                                  decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      gradient: const LinearGradient(colors: [
                                        Color.fromRGBO(77, 137, 255, 18.5),
                                        Colors.blueAccent,
                                        Color(0xFF4D89FF)
                                      ])),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      onPressed: () {
                                        Navigator.push(
                                            index,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    BookingFormScreen(
                                                      officeId:
                                                          bookingOfficeViewModel
                                                              .floor[context].id
                                                              .toString(),
                                                      buildingId: widget.id,
                                                      office:
                                                          bookingOfficeViewModel
                                                              .floor,
                                                    )));
                                      },
                                      child: const Text(
                                        'Book Now',
                                        style: TextStyle(fontSize: 10),
                                      )),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget rowDetail(int context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[200],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.photo_size_select_small_outlined,
                color: Colors.black,
                size: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                bookingOfficeViewModel.floor[context].floorSize ?? '',
                style: const TextStyle(fontSize: 8),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[200],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.group,
                color: Colors.black,
                size: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                  bookingOfficeViewModel.floor[context].maxCapacity
                          .toString()
                          .isNotEmpty
                      ? bookingOfficeViewModel.floor[context].maxCapacity
                          .toString()
                      : 'null',
                  style: const TextStyle(
                      fontSize: 8, overflow: TextOverflow.ellipsis))
            ],
          ),
        ),
      ],
    );
  }

  Widget writeReview() {
    return Flexible(
      child: TextFormField(
        controller: reviewController,
        minLines: 1,
        maxLines: 5,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          hintStyle: const TextStyle(fontSize: 12),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(10)),
          hintText: 'Write review..',
        ),
      ),
    );
  }

  Widget buttonSendReview(BuildContext context) {
    return InkWell(
      onTap: () async {
        showDialog(context: context, builder: (_) => alertDialogRating());
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: const Color(0xFF4D89FF),
            borderRadius: BorderRadius.circular(10)),
        child: const Icon(
          Icons.send,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget profilePicture() {
    return SizedBox(
      width: 36,
      height: 36,
      child: ClipOval(
        child: Image.network(
          'https://images.ctfassets.net/hrltx12pl8hq/3AnnkVqrlhrqb9hjlMBzKX/693a8e5d40b4b6c55a7673ca4c807eef/Girl-Stock?fit=fill&w=480&h=270',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget nameUserReview(int index) {
    return Text(
      bookingOfficeViewModel.review[index].user.firstName ?? 'Person',
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
    );
  }

  Widget starRating(int index) {
    return RatingBar.builder(
        ignoreGestures: true,
        allowHalfRating: true,
        maxRating: 10,
        itemSize: 15,
        initialRating: bookingOfficeViewModel.review[index].rating.toDouble(),
        itemBuilder: (context, index) {
          return const Icon(
            Icons.star_sharp,
            color: Colors.yellow,
            size: 30,
          );
        },
        onRatingUpdate: (rating) {});
  }

  Widget listReview() {
    return ListView.builder(
        itemCount: bookingOfficeViewModel.review.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profilePicture(),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      nameUserReview(index),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          starRating(index),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            bookingOfficeViewModel.review[index].rating
                                .toString(),
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        bookingOfficeViewModel.review[index].review,
                        maxLines: 10,
                        style: const TextStyle(
                            fontSize: 10, overflow: TextOverflow.ellipsis),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget alertDialogRating() {
    return AlertDialog(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(8)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Rating',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Please rate this building',
              style: const TextStyle(fontSize: 17, color: Color(0xFF868686)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ratingBuilder(),
            const SizedBox(
              height: 20,
            ),
            buttonOk()
          ],
        ));
  }

  Widget ratingBuilder() {
    return RatingBar.builder(
        updateOnDrag: true,
        allowHalfRating: true,
        maxRating: 10,
        itemSize: 30,
        initialRating: rating,
        itemBuilder: (context, index) {
          return const Icon(
            Icons.star_sharp,
            color: Colors.yellow,
            size: 30,
          );
        },
        onRatingUpdate: (rating) {
          setState(() {
            this.rating = rating;
          });
        });
  }

  Widget buttonOk() {
    return Container(
      width: MediaQuery.of(context).size.height,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(77, 137, 255, 18.5),
            Colors.blueAccent,
            Color(0xFF4D89FF)
          ])),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              primary: Colors.transparent,
              shadowColor: Colors.transparent),
          onPressed: () async {
            bookingOfficeViewModel
                .sendReview(
                    PostReview(
                        buildingId: widget.id,
                        review: reviewController.text,
                        rating: rating.toInt()),
                    context)
                .then((value) => getDataReview());
            Navigator.pop(context);
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
