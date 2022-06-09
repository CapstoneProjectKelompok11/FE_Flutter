import 'package:app_booking_office/property/bottom_navigation_bar.dart';
import 'package:app_booking_office/screen/booking_office/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.all(16),
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
                  fontSize: 18,
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
                  fontSize: 18,
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
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        buttonFavorite(),
      ],
    );
  }

  Widget picture() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
            image: NetworkImage(
                'https://www.highstreet.co.id/UserFiles/Image/kanmo/IKP_0061.jpg'),
            fit: BoxFit.cover),
      ),
    );
  }

  Widget location() {
    return Row(
      children: const [
        Icon(
          Icons.location_on,
          color: Colors.blue,
          size: 18,
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 80),
            child: Text(
              '''Jl. Gunung Sahari Raya No. 78 ,Kota jakarta Pusat, DKI Jakarta''',
              maxLines: 2,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
        ),
      ],
    );
  }

  Widget title() {
    return const Text(
      'Atria, Gedung Konica',
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis),
    );
  }

  Widget price() {
    return const Text(
      '\$1993/month',
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    );
  }

  Widget textDEscription() {
    return const ReadMoreText(
      '''Gedung Konica adalah bangunan kantor tipe Grade C yang terletak di Jakarta Pusat. Dengan total luas bangunan N/A m2, bangunan kantor beralamat di Jl.Gunung Sahari Raya No 78 tersedia untuk sewa. Gedung Konica memiliki 100, Dengan total luas bangunan N/A m2, bangunan kantor beralamat di Jl.Gunung Sahari Raya No 78 tersedia untuk sewa. Gedung Konica memiliki 100''',
      trimLines: 5,
      textAlign: TextAlign.left,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Read More',
      trimExpandedText: 'Read less',
      lessStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      moreStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      style: TextStyle(fontSize: 12, color: Colors.grey),
    );
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
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white),
        child: _isfavorite
            ? const Icon(
                Icons.favorite_border_sharp,
                color: Colors.black,
                size: 20,
              )
            : const Icon(
                Icons.favorite,
                color: Colors.redAccent,
                size: 20,
              ),
      ),
    );
  }
}
