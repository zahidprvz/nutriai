import 'package:flutter/material.dart';

class ImageWithTextWidget extends StatelessWidget {
  final String imagePath;
  final String text;

  const ImageWithTextWidget({
    Key? key,
    required this.imagePath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200,
        ),
        Container(
          color: Colors.black.withOpacity(0.5),
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}