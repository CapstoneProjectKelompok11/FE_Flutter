import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatefulWidget {
  InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFF4F4F4),
        elevation: 0,
        title: const Text(
          'Inbox',
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              searchField(),
              const SizedBox(
                height: 10,
              ),
              listChat(),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchField() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
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
                hintText: 'Search chat and messages',
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

  Widget listChat() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: ClipOval(
                      child: Image.network(
                    'https://6.viki.io/image/794f78782da94d6799fd3cd978e50e96/dummy.jpeg?s=900x600&e=t',
                    fit: BoxFit.cover,
                  ))),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'SCBD, Equity Tower',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '14:70',
                    style: TextStyle(color: Color(0xFF868686), fontSize: 12),
                  )
                ],
              ),
              subtitle: const Text(
                'Welcome to mobile legend',
                style: TextStyle(fontSize: 13, color: Color(0xFF868686)),
              ),
            );
          }),
    );
  }
}
