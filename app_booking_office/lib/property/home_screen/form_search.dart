import 'package:app_booking_office/screen/booking_office/search_screen.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: TextFormField(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const SearchScreen()));
            },
            readOnly: true,
            controller: searchController,
            decoration: InputDecoration(
                hintStyle: const TextStyle(fontSize: 12),
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
                  size: 30,
                )),
          ),
        ),
      ),
    );
    
  }
}
