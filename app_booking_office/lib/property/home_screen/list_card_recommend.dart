import 'package:app_booking_office/model/book_office_model.dart';
import 'package:app_booking_office/screen/booking_office/detail_screen.dart';
import 'package:flutter/material.dart';

class ListCardRecommend extends StatefulWidget {
  const ListCardRecommend({Key? key}) : super(key: key);

  @override
  State<ListCardRecommend> createState() => _ListCardRecommendState();
}

class _ListCardRecommendState extends State<ListCardRecommend> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: image.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => DetailScreen()));
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
                          price(),
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
                          rating(),
                          const SizedBox(
                            height: 5,
                          ),
                          rowDetail(),
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
      width: 120,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: NetworkImage(image[index]), fit: BoxFit.cover)),
    );
  }

  Widget price() {
    return Row(
      children: const [
        Text(
          '\$1993',
          maxLines: 1,
          style: TextStyle(
              color: Color(0xFF4D89FF),
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.bold),
        ),
        Text(
          '/Month',
          maxLines: 1,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }

  Widget title() {
    return Container(
      width: 200,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: const Text(
        'Senayan city',
        maxLines: 2,
        style: TextStyle(
            fontSize: 17,
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
          width: 180,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: const Text(
            'Senayan, Jakarta',
            maxLines: 2,
            style: TextStyle(
                color: Colors.black,
                fontSize: 10,
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
          size: 15,
        ),
        SizedBox(
          width: 2,
        ),
        Icon(
          Icons.star,
          color: Color(0xFFFBCD0A),
          size: 15,
        ),
        SizedBox(
          width: 2,
        ),
        Icon(
          Icons.star,
          color: Color(0xFFFBCD0A),
          size: 15,
        ),
        SizedBox(
          width: 2,
        ),
        Icon(
          Icons.star,
          color: Color(0xFFFBCD0A),
          size: 15,
        ),
        SizedBox(
          width: 2,
        ),
        Icon(
          Icons.star,
          color: Color(0xFFFBCD0A),
          size: 15,
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          '(120) Review',
          style: TextStyle(fontSize: 7),
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
              Text('200', style: TextStyle(fontSize: 10))
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
}
