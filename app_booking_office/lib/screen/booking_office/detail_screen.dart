import 'package:app_booking_office/property/bottom_navigation_bar.dart';
import 'package:app_booking_office/screen/booking_office/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DetailScreen extends StatefulWidget {
  String? picture;
  String? title;
  String? price;
  String? location;
  String? description;
  DetailScreen(
      {Key? key,
      this.picture,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
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
                'Amenity',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              rowBox(),
              const SizedBox(
                height: 30,
              ),
              elevatedButtonBookNow()
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
        ? Text(
            widget.title!,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis),
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

  Widget rowBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(8)),
        ),
        Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(8)),
        ),
        Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(8)),
        ),
        Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(8)),
        ),
        Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(8)),
        ),
      ],
    );
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
          onPressed: () {},
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
}
