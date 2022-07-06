import 'package:app_booking_office/model/book_office_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingDialog extends StatefulWidget {
  const RatingDialog({Key? key}) : super(key: key);

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(8)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Rating',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Please rate this building',
              style: TextStyle(fontSize: 17, color: Color(0xFF868686)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: RatingBar.builder(
            updateOnDrag: true,
            allowHalfRating: true,
            maxRating: 10,
            itemSize: 30,
            initialRating: rating,
            itemBuilder: (context, index) {
              return const Icon(
                Icons.star_sharp,
                color: Colors.yellow,
                size: 30,
              );
            },
            onRatingUpdate: (rating) {
              setState(() {
                this.rating = rating;
              });
            }));
  }
}
