import 'package:app_booking_office/model/book_office_model.dart';
import 'package:app_booking_office/property/bottom_navigation_bar.dart';
import 'package:app_booking_office/screen/booking_office/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _isFavorite = true;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: SafeArea(
          child: SingleChildScrollView(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                appBar(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textFormFieldSearch(),
                    categorize(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                cardSearchResult(),
              ],
            ),
          ),
        ),
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
          'Result for Jakarta',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
        ),
        const Icon(
          Icons.settings_outlined,
          color: Colors.black,
          size: 30,
        )
      ],
    );
  }

  Widget cardSearchResult() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: image.length,
          itemBuilder: (context, index) {
            return Container(
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
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(image[index]),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  child: Text('Menara Palma centre ',
                                      maxLines: 2,
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
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
                                            Icons.groups_rounded,
                                            color: Colors.black,
                                            size: 15,
                                          ),
                                          Text(
                                            '200',
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: 10,
                                              overflow: TextOverflow.ellipsis,
                                            ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: const [
                                          Icon(
                                            Icons.man,
                                            color: Colors.black,
                                            size: 15,
                                          ),
                                          Text('20',
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 10,
                                                overflow: TextOverflow.ellipsis,
                                              ))
                                        ],
                                      ),
                                    ),
                                    Container(
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
                                            Icons.stairs,
                                            color: Colors.black,
                                            size: 15,
                                          ),
                                          Text('8',
                                              style: TextStyle(
                                                fontSize: 10,
                                                overflow: TextOverflow.ellipsis,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.blue,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                location(),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            rating(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(top: 15, right: 15, child: buttonFavorite())
                ],
              ),
            );
          }),
    );
  }

  Widget buttonFavorite() {
    return IconButton(
        onPressed: () {
          setState(() {
            _isFavorite = !_isFavorite;
          });
        },
        icon: _isFavorite
            ? const Icon(
                Icons.favorite_outline,
                color: Colors.white,
              )
            : const Icon(
                Icons.favorite,
                color: Colors.redAccent,
              ));
  }

  Widget textFormFieldSearch() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          right: 12,
        ),
        child: TextFormField(
          controller: searchController,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              hintText: 'Find location, or name a place',
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 35,
              )),
        ),
      ),
    );
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

  Widget price() {
    return const Text(
      '\$199388888',
      maxLines: 1,
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
          overflow: TextOverflow.ellipsis),
    );
  }

  Widget rating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Icon(
              Icons.star,
              color: Color(0xFFFBCD0A),
              size: 20,
            ),
            SizedBox(
              width: 2,
            ),
            Icon(
              Icons.star,
              color: Color(0xFFFBCD0A),
              size: 20,
            ),
            SizedBox(
              width: 2,
            ),
            Icon(
              Icons.star,
              color: Color(0xFFFBCD0A),
              size: 20,
            ),
            SizedBox(
              width: 2,
            ),
            Icon(
              Icons.star,
              color: Color(0xFFFBCD0A),
              size: 20,
            ),
            SizedBox(
              width: 2,
            ),
            Icon(
              Icons.star,
              color: Color(0xFFFBCD0A),
              size: 20,
            ),
            SizedBox(
              width: 2,
            ),
          ],
        ),
        price(),
      ],
    );
  }

  Widget location() {
    return const Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 40),
        child: Text(
          'Jl. Haji R. Rasuna Said Karet Kuningan',
          maxLines: 2,
          style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}
