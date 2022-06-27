import 'package:app_booking_office/property/bottom_navigation_bar.dart';
import 'package:app_booking_office/property/loading_screen.dart';
import 'package:app_booking_office/screen/booking_office/booking_form_screen.dart';
import 'package:app_booking_office/screen/booking_office/home_screen.dart';
import 'package:app_booking_office/screen/booking_office/view_model/booking_office_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  late BookingOfficeViewModel bookingOfficeViewModel;
  Future<void> getDataFloor() async {
    Future.delayed(const Duration(milliseconds: 1), () async {
      bookingOfficeViewModel =
          Provider.of<BookingOfficeViewModel>(context, listen: false);
      await bookingOfficeViewModel.getFloor(widget.id);
    });
  }

  @override
  void initState() {
    super.initState();
    getDataFloor();
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
                children: [title(), price()],
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  writeReview(),
                  const SizedBox(width: 10),
                  buttonSendReview(),
                ],
              ),
              Row(
                children: [],
              )
            ],
          ),
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: BottomAppBar(elevation: 0, child: elevatedButtonBookNow()),
      ),
    );
  }

  Widget appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const BottomNavBar()));
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
                widget.title!,
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

  Widget price() {
    return widget.price != null
        ? Text(
            '\$${widget.price}/month',
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          )
        : const Text('null');
  }

  Widget textDEscription() {
    return widget.description != null
        ? ReadMoreText(
            widget.description!,
            trimLines: 5,
            textAlign: TextAlign.left,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Read More',
            trimExpandedText: 'Read less',
            lessStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
            moreStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          )
        : const Text('null');
  }

  Widget elevatedButtonBookNow() {
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
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => BookingFormScreen()));
          },
          child: const Text('Book Now')),
    );
  }

  Widget buttonFavorite() {
    return InkWell(
      onTap: () {
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
                                image: NetworkImage(
                                    'http://ec2-18-206-213-94.compute-1.amazonaws.com/api/floor/image/${bookingOfficeViewModel.floor[context].image}'),
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
                              bookingOfficeViewModel.floor[context].name,
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
                                  'Rp. ${bookingOfficeViewModel.floor[context].startingPrice.toString()}/bulan',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
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
                                                    BookingFormScreen()));
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
                bookingOfficeViewModel.floor[context].floorSize,
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
              Text(bookingOfficeViewModel.floor[context].maxCapacity.toString(),
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
      child: SizedBox(
        height: 40,
        child: TextFormField(
          decoration: InputDecoration(
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
      ),
    );
  }

  Widget buttonSendReview() {
    return InkWell(
      onTap: (){},
      child: Container(
        padding: const EdgeInsets.all(8),
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
}
