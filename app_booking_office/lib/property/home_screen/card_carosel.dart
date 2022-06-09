import 'package:app_booking_office/model/book_office_model.dart';
import 'package:app_booking_office/screen/booking_office/detail_screen.dart';
import 'package:flutter/material.dart';

class CardCarosel extends StatefulWidget {
  const CardCarosel({Key? key}) : super(key: key);

  @override
  State<CardCarosel> createState() => _CardCaroselState();
}

class _CardCaroselState extends State<CardCarosel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Top Places',
                style: TextStyle(fontWeight: FontWeight.bold)),
            buttonViewMore(),
          ],
        ),
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: image.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => DetailScreen()));
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      picture(index),
                      const SizedBox(
                        height: 5,
                      ),
                      title(),
                      const SizedBox(
                        height: 5,
                      ),
                      location(),
                      const SizedBox(
                        height: 5,
                      ),
                      rowDetail(),
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 56.5, horizontal: 80),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: NetworkImage(image[index]), fit: BoxFit.cover)),
    );
  }

  Widget title() {
    return Container(
      width: 140,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: const Text(
        'Bandung, Jawa barat',
        maxLines: 2,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }

  Widget location() {
    return Row(
      children: [
        const Icon(
          Icons.location_on,
          color: Color(0xFF4D89FF),
          size: 15,
        ),
        Container(
          width: 140,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: const Text(
            'Senayan, Jakarta',
            maxLines: 1,
            style: TextStyle(
                color: Colors.black,
                fontSize: 10,
                overflow: TextOverflow.ellipsis),
          ),
        )
      ],
    );
  }

  Widget rowDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          width: 60,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[200],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.groups_rounded,
                color: Colors.black,
                size: 15,
              ),
              Text(
                '200',
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 5),
          width: 40,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[200],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.man,
                color: Colors.black,
                size: 15,
              ),
              Text('10', style: TextStyle(fontSize: 10))
            ],
          ),
        ),
        Container(
          width: 50,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[200],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.stairs,
                color: Colors.black,
                size: 15,
              ),
              Text('8', style: TextStyle(fontSize: 10))
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
          style:
              TextStyle(color: Color(0xFF4D89FF), fontWeight: FontWeight.bold),
        ));
  }
}
