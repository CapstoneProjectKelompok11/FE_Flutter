import 'package:app_booking_office/model/book_office_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.settings_outlined,
                  color: Colors.black,
                  size: 25,
                ),
                dropDownButtonLocation(),
                const SizedBox(
                  height: 10,
                ),
                textFormFieldSearch(),
                const SizedBox(
                  height: 8,
                ),
                cardTopPlaces(),
                const SizedBox(
                  height: 10,
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
                              style: TextStyle(color: Colors.black),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: image.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                              image: NetworkImage(image[index]),
                                              fit: BoxFit.cover)),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: const [
                                            Text(
                                              '\$1993',
                                              style: TextStyle(
                                                  color: Color(0xFF4D89FF),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text('/Month')
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
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
      child: DropdownButton(
          underline: const SizedBox(),
          alignment: AlignmentDirectional.centerStart,
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
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14),
                      )
                    ],
                  )))
              .toList(),
          onChanged: (item) {
            setState(() {
              selectedItem = item.toString();
            });
          }),
    );
  }

  Widget textFormFieldSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 19,
      ),
      child: TextFormField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(8)),
            hintText: 'Find location, or name a place',
            suffixIcon: const Icon(
              Icons.search,
              color: Colors.black,
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
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: image.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 160,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: NetworkImage(image[index]),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'SCBD',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
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
                            style: TextStyle(color: Colors.black, fontSize: 10),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(
                                  Icons.groups_rounded,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                Text('200')
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
                                  size: 20,
                                ),
                                Text('10')
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
                                  size: 20,
                                ),
                                Text('8')
                              ],
                            ),
                          ),
                        ],
                      )
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
}
