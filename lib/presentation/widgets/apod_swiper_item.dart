import 'package:flutter/material.dart';
import 'package:nasa_curiosities/domain/entities/picture.dart';

class Apod extends StatelessWidget {
  final Picture apod;
  const Apod({super.key, required this.apod});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(apod.url),
        const Align(
            alignment: Alignment.topLeft,
            child: Text('Astronomy Picture Of The Day',
                style: TextStyle(color: Colors.white))),
      ],
    );
  }
}
