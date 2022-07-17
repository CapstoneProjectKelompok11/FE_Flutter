import 'package:app_booking_office/screen/booking_office/view_model/booking_office_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

import '../../model/book_office_model.dart';

class ChatScreen extends StatefulWidget {
  String buildingId;
  ChatScreen({Key? key, required this.buildingId}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [
    Message(
        text: "Halo saya mau pesan gedung ini lantai 5",
        date: DateTime.now().subtract(Duration.zero),
        isSentByMe: true),
    Message(
        text: 'Iya silahkan dipesan',
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: 'Iya ',
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
  ].reversed.toList();

  late BookingOfficeViewModel bookingOfficeViewModel;

  TextEditingController chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bookingOfficeViewModel = Provider.of<BookingOfficeViewModel>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        titleTextStyle: const TextStyle(color: Colors.black),
        backgroundColor: const Color(0xFFF4F4F4),
        elevation: 0,
        leading: buttonBack(),
        title: Row(
          children: [
            profilePicture(),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textTitle(),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Admin',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                )
              ],
            )
          ],
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                child: GroupedListView<Message, DateTime>(
                    padding: const EdgeInsets.all(8),
                    reverse: true,
                    order: GroupedListOrder.DESC,
                    groupHeaderBuilder: (Message message) => const SizedBox(),
                    itemBuilder: (context, Message message) => Align(
                          alignment: message.isSentByMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: cardChatStyle(message),
                        ),
                    elements: messages,
                    groupBy: (message) => DateTime(2022))),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Row(
                children: [
                  textBoxWriteChat(),
                  const SizedBox(
                    width: 10,
                  ),
                  buttonSendChat(),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget profilePicture() {
    return SizedBox(
      width: 37,
      height: 37,
      child: ClipOval(
        child: Image.network(
          'https://i.pinimg.com/originals/32/67/44/3267446c4df3e091a2b117514bc71a14.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget cardChatStyle(Message message) {
    return Card(
      color: message.isSentByMe
          ? const Color(0xFFFFFFFF)
          : const Color(0xFF4D89FF),
      shape: const StadiumBorder(),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          message.text,
          style: TextStyle(
              color: message.isSentByMe ? Colors.black : Colors.white,
              fontSize: 12),
        ),
      ),
    );
  }

  Widget textBoxWriteChat() {
    return Flexible(
      child: TextFormField(
        controller: chatController,
        minLines: 1,
        maxLines: 5,
        style: const TextStyle(fontSize: 12),
        decoration: InputDecoration(
            fillColor: const Color(0xFFF4F4F4),
            filled: true,
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(20)),
            hintText: 'Type your message here...'),
      ),
    );
  }

  Widget buttonSendChat() {
    return InkWell(
      onTap: () async {
        await bookingOfficeViewModel.sendMessage(DataMessage(
            buildingId: widget.buildingId, pesan: chatController.text));
        final message = Message(
            text: chatController.text, isSentByMe: true, date: DateTime.now());
        setState(() {
          messages.add(message);
        });
      },
      child: const Icon(
        Icons.send,
        color: Color(0xFF4D89FF),
        size: 30,
      ),
    );
  }

  Widget buttonBack() {
    return InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          CupertinoIcons.arrow_left,
          color: Colors.black,
          size: 30,
        ));
  }

  Widget textTitle() {
    return const Text(
      'SCBD, Equity Tower',
      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
    );
  }
}
