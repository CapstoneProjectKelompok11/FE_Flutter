import 'package:app_booking_office/model/book_office_model.dart';
import 'package:app_booking_office/screen/auth/login_screen.dart';
import 'package:app_booking_office/screen/auth/view_model/auth_view_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items = ['Jawa Barat', 'Jawa Timur', 'Jawa Tengah', 'Jakarta'];
  String selectedItem = 'Jakarta';
  int activeIndex = 0;
  late AuthViewModel authViewModel;

  @override
  Widget build(BuildContext context) {
    authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textFormFieldSearch(),
                const SizedBox(
                  height: 20,
                ),
                const Text('Top Place in\nJakarta',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 25,
                ),
                dropDownButton(),
                const SizedBox(
                  height: 5,
                ),
                caroeselTopList(),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Recommended',
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                gridViewBottomSection()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textFormFieldSearch() {
    return Center(
      child: TextFormField(
        decoration: InputDecoration(
            suffixIcon: const Icon(Icons.search),
            hintText: 'find location or name a place',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
      ),
    );
  }

  Widget dropDownButton() {
    return Container(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(77, 137, 255, 18.5),
            Colors.blueAccent,
            Color(0xFF4D89FF)
          ])),
      child: SizedBox(
        width: 120,
        height: 30,
        child: DropdownButton(
            dropdownColor: const Color(0xFF4D89FF),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            alignment: AlignmentDirectional.centerStart,
            elevation: 0,
            underline: const SizedBox(),
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
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        Text(
                          item,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        ),
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

  Widget caroeselTopList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            authViewModel.logout();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const LoginScreen()));
          },
          child: Text(
            'More',
            style: TextStyle(color: Colors.grey[300]),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            child: CarouselSlider.builder(
          options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
              height: 150,
              autoPlay: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enlargeCenterPage: true),
          itemCount: image.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: NetworkImage(image[index]), fit: BoxFit.cover)),
            );
          },
        )),
        const SizedBox(
          height: 10,
        ),
        buildIndicator(),
      ],
    );
  }

  Widget buildIndicator() {
    return Center(
      child: AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: image.length,
          effect: const WormEffect(
            dotWidth: 10,
            dotHeight: 10,
          )),
    );
  }

  Widget gridViewBottomSection() {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1 / 1),
            itemCount: image.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(image[index]), fit: BoxFit.cover)),
              );
            },
          ),
        )
      ],
    );
  }
}
