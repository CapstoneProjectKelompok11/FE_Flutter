import 'package:app_booking_office/screen/booking_office/view_model/booking_office_view_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../property/loading_screen.dart';

class ConfirmationPaymentScreen extends StatefulWidget {
  String picture;
  String? reservationId;
  String? buildingTitle;
  String? address;
  String? participant;
  String? bookingId;
  String? buildingType;
  String? floor;
  String? sizeRoom;
  String? name;
  String? email;
  String? phone;
  String? companyName;
  String? bookingDate;
  String? dealPrice;
  String? totalPrice;
  ConfirmationPaymentScreen(
      {Key? key,
      required this.picture,
      required this.reservationId,
      required this.buildingTitle,
      required this.address,
      required this.participant,
      required this.bookingId,
      required this.buildingType,
      required this.floor,
      required this.sizeRoom,
      required this.name,
      required this.email,
      required this.phone,
      required this.companyName,
      required this.bookingDate,
      this.dealPrice,
      required this.totalPrice})
      : super(key: key);

  @override
  State<ConfirmationPaymentScreen> createState() =>
      _ConfirmationPaymentScreenState();
}

class _ConfirmationPaymentScreenState extends State<ConfirmationPaymentScreen> {
  TextStyle titleStyle = const TextStyle(
      fontSize: 10, color: Color(0xFF5F5F5F), fontWeight: FontWeight.w600);
  TextStyle resultStyle =
      const TextStyle(fontSize: 10, fontWeight: FontWeight.w600);
  late BookingOfficeViewModel bookingOfficeViewModel;

  @override
  Widget build(BuildContext context) {
    bookingOfficeViewModel = Provider.of<BookingOfficeViewModel>(context);
    final isLoading =
        bookingOfficeViewModel.states == BookOfficeViewState.loading;
    final isError = bookingOfficeViewModel.states == BookOfficeViewState.error;
    if (isLoading) {
      return const LoadingScreen();
    }
    if (isError) {
      return const Center(
        child: Text('Something wrong :('),
      );
    }
    return Scaffold(
        backgroundColor: const Color(0xFFF4F4F4),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFF4F4F4),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              CupertinoIcons.arrow_left,
              size: 30,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'Confirmation Receipt',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 30,
            right: 30,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  floorPicture(),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title(),
                      const SizedBox(
                        height: 5,
                      ),
                      location(),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          participant(),
                          const SizedBox(
                            width: 10,
                          ),
                          bookingId()
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              roomInformation(),
              const SizedBox(
                height: 20,
              ),
              customerInformation(),
              const SizedBox(
                height: 20,
              ),
              price(),
              const SizedBox(
                height: 20,
              ),
              uploadPicture(),
              const SizedBox(
                height: 20,
              ),
              buttonConfirmation()
            ],
          ),
        ));
  }

  Widget floorPicture() {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: NetworkImage(widget.picture.isNotEmpty
                  ? 'http://ec2-18-206-213-94.compute-1.amazonaws.com/api/floor/image/${widget.picture}'
                  : 'https://thumbs.dreamstime.com/b/transparent-designer-must-have-fake-background-39672616.jpg'),
              fit: BoxFit.cover)),
    );
  }

  Widget title() {
    return Text(
      widget.buildingTitle ?? '',
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
    );
  }

  Widget location() {
    return Row(
      children: [
        const Icon(
          Icons.location_on,
          color: Color(0xFF4D89FF),
          size: 10,
        ),
        Container(
          width: 180,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Text(
            widget.address ?? '',
            maxLines: 2,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 9,
                overflow: TextOverflow.ellipsis),
          ),
        )
      ],
    );
  }

  Widget participant() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Participant',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
        Text(
          widget.participant ?? '',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget bookingId() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Booking ID',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
        Text(
          widget.bookingId ?? '',
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget roomInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Room Information',
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Building Type',
              style: titleStyle,
            ),
            Text(
              widget.buildingType ?? '',
              style: resultStyle,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Floor',
              style: titleStyle,
            ),
            Text(
              widget.floor ?? '',
              style: resultStyle,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'SizeRoom',
              style: titleStyle,
            ),
            Text(
              widget.sizeRoom ?? '',
              style: resultStyle,
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget customerInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Customer Information',
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Name',
              style: titleStyle,
            ),
            Text(
              widget.name ?? '',
              style: resultStyle,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Email',
              style: titleStyle,
            ),
            Text(
              widget.email ?? '',
              style: resultStyle,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Phone Number',
              style: titleStyle,
            ),
            Text(
              widget.phone ?? '',
              style: resultStyle,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Company Name',
              style: titleStyle,
            ),
            Text(
              widget.companyName ?? '',
              style: resultStyle,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Booking Date',
              style: titleStyle,
            ),
            Text(
              widget.bookingDate ?? '',
              style: resultStyle,
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget price() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Price',
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Deal Price',
              style: titleStyle,
            ),
            Text(
              NumberFormat.currency(
                locale: 'id',
                symbol: 'Rp. ',
              ).format(int.parse(widget.dealPrice ?? '0')),
              style: resultStyle,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Price',
              style: titleStyle,
            ),
            Text(
              NumberFormat.currency(
                locale: 'id',
                symbol: 'Rp. ',
              ).format(int.parse(widget.totalPrice ?? '0')),
              style: resultStyle,
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget uploadPicture() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payment Proof',
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        DottedBorder(
            color: const Color(0xFFB7B4B4),
            borderType: BorderType.RRect,
            radius: const Radius.circular(8),
            child: InkWell(
              onTap: () async {
                bookingOfficeViewModel.pickImageReceiptGallery();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.download,
                      size: 30,
                      color: Color(0xFF4D89FF),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      bookingOfficeViewModel.imageReceipt == null
                          ? 'Click to select file'
                          : bookingOfficeViewModel.imageReceipt.toString(),
                      style: const TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }

  Widget buttonConfirmation() {
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
          onPressed: () async {
            await bookingOfficeViewModel.postImageReceipt(
                bookingOfficeViewModel.imageReceipt!, widget.reservationId!);
          },
          child: const Text(
            'Confirm & Pay',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
