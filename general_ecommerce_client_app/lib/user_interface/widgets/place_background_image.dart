import 'package:flutter/material.dart';

class PlaceBackgroundImage extends StatelessWidget {
  const PlaceBackgroundImage({super.key, required this.imageAddress, required this.child});
  final String imageAddress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Image(image: AssetImage(imageAddress,), fit: BoxFit.cover,height: double.maxFinite, width: double.maxFinite,),
          child,
        ],
      );
  }
}
