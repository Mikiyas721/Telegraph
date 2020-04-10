import 'package:flutter/material.dart';

class MyImageView extends StatelessWidget {
  final double _width;
  final double _height;
  final String _imageURL;

  MyImageView(this._imageURL, {width = 40.0, height = 50.0})
      : _width = width,
        _height = height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image:
              DecorationImage(fit: BoxFit.fill, image: AssetImage(_imageURL))),
    );
  }
}
