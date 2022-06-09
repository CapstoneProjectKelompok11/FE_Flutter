import 'package:flutter/material.dart';

class ButtonFavorite extends StatefulWidget {
  ButtonFavorite({Key? key}) : super(key: key);

  @override
  State<ButtonFavorite> createState() => _ButtonFavoriteState();
}

class _ButtonFavoriteState extends State<ButtonFavorite> {
  bool _isFavorite = true;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            _isFavorite = !_isFavorite;
          });
        },
        icon: _isFavorite
            ? const Icon(
                Icons.favorite_outline,
                color: Colors.white,
              )
            : const Icon(
                Icons.favorite,
                color: Colors.redAccent,
              ));
  }
}
