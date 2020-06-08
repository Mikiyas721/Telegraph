import 'package:flutter/material.dart';

class MyImageView extends StatelessWidget {
  final double _width;
  final double _height;
  final String _imageURL;
  final Function _onTap;
  final Function _onLongPress;
  final Function _onDoubleTap;

  MyImageView(
      {imageURL, width = 40.0, height = 50.0, onTap, onLongPress, onDoubleTap})
      : _imageURL = imageURL,
        _width = width,
        _height = height,
        _onTap = onTap,
        _onDoubleTap = onDoubleTap,
        _onLongPress = onLongPress
  ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      onDoubleTap: _onDoubleTap,
      onLongPress: _onLongPress,
      child: Container(
      width: _width,
      height: _height,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image:
          DecorationImage(fit: BoxFit.fill, image: AssetImage(_imageURL))),
    ));
  }
}
