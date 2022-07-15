import 'package:app_booking_office/screen/booking_office/view_model/booking_office_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InboxScreen extends StatefulWidget {
  InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  TextEditingController searchController = TextEditingController();
  late BookingOfficeViewModel bookingOfficeViewModel;

  Future<void> initListMessage() async {
    Future.delayed(Duration.zero, () async {
      bookingOfficeViewModel =
          Provider.of<BookingOfficeViewModel>(context, listen: false);
      await bookingOfficeViewModel.getListMessage();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initListMessage();
  }

  @override
  Widget build(BuildContext context) {
    bookingOfficeViewModel = Provider.of<BookingOfficeViewModel>(context);
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                searchField(),
                const SizedBox(
                  height: 20,
                ),
                listChat(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget searchField() {
    return Center(
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
    );
  }

  Widget listChat() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: bookingOfficeViewModel.listChat.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    textTime(index),
                    Row(
                      children: [
                        profilePicture(index),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              title(index),
                              const SizedBox(
                                height: 5,
                              ),
                              textMessage(index)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget textTime(int index) {
    return Positioned(
      top: 0,
      right: 0,
      child: Text(
        bookingOfficeViewModel.listChat[index].latestMessageTimestamp,
        style: const TextStyle(color: Color(0xFF868686), fontSize: 12),
      ),
    );
  }

  Widget profilePicture(int index) {
    return SizedBox(
        width: 50,
        height: 50,
        child: ClipOval(
            child: Image.network(
          bookingOfficeViewModel.listChat[index].buildingImages.isNotEmpty
              ? 'http://ec2-18-206-213-94.compute-1.amazonaws.com/api/building/image/${bookingOfficeViewModel.listChat[index].buildingImages}'
              : 'https://lpm.ulm.ac.id/image/desain/empty.jpg',
          fit: BoxFit.cover,
        )));
  }

  Widget title(int index) {
    return Text(
      bookingOfficeViewModel.listChat[index].buildingName.isNotEmpty
          ? bookingOfficeViewModel.listChat[index].buildingName
          : '',
      maxLines: 2,
      style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis),
    );
  }

  Widget textMessage(int index) {
    return Text(
      bookingOfficeViewModel.listChat[index].latestMessage.isNotEmpty
          ? bookingOfficeViewModel.listChat[index].latestMessage
          : '',
      style: const TextStyle(
          fontSize: 13,
          color: Color(
            0xFF868686,
          ),
          overflow: TextOverflow.ellipsis),
    );
  }
}
