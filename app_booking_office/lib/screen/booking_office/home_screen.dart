import 'package:app_booking_office/model/book_office_model.dart';
import 'package:app_booking_office/screen/booking_office/detail_screen.dart';
import 'package:app_booking_office/screen/booking_office/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items = [
    'Jakarta, Indonesia',
    'Bandung, Indonesia',
    'Surabaya, Indonesia',
    'Medan, Indonesia',
    'Bali, Indonesia'
  ];
  String selectedItem = 'Jakarta, Indonesia';
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => SearchScreen()));
                  },
                  child: const Icon(
                    Icons.settings_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                dropDownButtonLocation(),
                const SizedBox(
                  height: 18,
                ),
                textFormFieldSearch(),
                const SizedBox(
                  height: 8,
                ),
                cardTopPlaces(),
                const SizedBox(
                  height: 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recommendation',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Komplek 1'),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'View More',
                              style: TextStyle(
                                  color: Color(0xFF4D89FF),
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    cardBottomSection(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dropDownButtonLocation() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 30,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: DropdownButton(
            icon: const Icon(
              CupertinoIcons.chevron_down,
              color: Colors.black,
              size: 15,
            ),
            underline: const SizedBox(),
            alignment: AlignmentDirectional.center,
            value: selectedItem,
            items: items
                .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Icon(
                            Icons.location_on,
                            color: Color(0xFF4D89FF),
                            size: 15,
                          ),
                        ),
                        Text(
                          item,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                        )
                      ],
                    )))
                .toList(),
            onChanged: (item) {
              setState(() {
                selectedItem = item.toString();
              });
            }),
      ),
    );
  }

  Widget textFormFieldSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 19,
      ),
      child: TextFormField(
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => SearchScreen()));
        },
        readOnly: true,
        controller: searchController,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(8)),
            hintText: 'Find location, or name a place',
            suffixIcon: const Icon(
              Icons.search_rounded,
              color: Colors.black,
              size: 35,
            )),
      ),
    );
  }

  Widget cardTopPlaces() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Top Places',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'View More',
                  style: TextStyle(
                      color: Color(0xFF4D89FF), fontWeight: FontWeight.bold),
                ))
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
                      pictureCarosel(index),
                      const SizedBox(
                        height: 5,
                      ),
                      titleCarosel(),
                      const SizedBox(
                        height: 5,
                      ),
                      locationCarosel(),
                      const SizedBox(
                        height: 5,
                      ),
                      rowDetailCarosel(),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget cardBottomSection() {
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
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: NetworkImage(image[index]),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Senayan city',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.location_on,
                                color: Color(0xFF4D89FF),
                                size: 15,
                              ),
                              Text(
                                'Senayan, Jakarta',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
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
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                          )
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

  Widget pictureCarosel(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 56.5, horizontal: 80),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: NetworkImage(image[index]), fit: BoxFit.cover)),
    );
  }

  Widget titleCarosel() {
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

  Widget locationCarosel() {
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

  Widget rowDetailCarosel() {
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
}
