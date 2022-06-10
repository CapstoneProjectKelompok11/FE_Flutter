import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 267,
        height: 40,
        child: TextFormField(
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
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: Colors.black,
                size: 30,
              )),
        ),
      ),
    );
  }
}
