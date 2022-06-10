import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({Key? key}) : super(key: key);

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  List<String> items = [
    'Jakarta, Indonesia',
    'Bandung, Indonesia',
    'Surabaya, Indonesia',
    'Medan, Indonesia',
    'Bali, Indonesia'
  ];
  String selectedItem = 'Jakarta, Indonesia';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 30,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: DropdownButton(
            icon: const Icon(
              CupertinoIcons.chevron_down,
              color: Colors.black,
              size: 15,
            ),
            underline: const SizedBox(),
            alignment: AlignmentDirectional.center,
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
                            color: Color(0xFF4D89FF),
                            size: 12,
                          ),
                        ),
                        Text(
                          item,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12),
                        )
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
    ;
  }
}
