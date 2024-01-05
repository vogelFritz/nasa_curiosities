import 'package:flutter/material.dart';
import 'package:nasa_curiosities/domain/entities/mars_photo.dart';

class MarsPhotosSwiperItem extends StatelessWidget {
  final MarsPhoto marsPhoto;
  const MarsPhotosSwiperItem({super.key, required this.marsPhoto});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.network(marsPhoto.imgSrc),
      const Positioned(
          top: 10,
          left: 15,
          child: Text('Mars Photos', style: TextStyle(color: Colors.white)))
    ]);
  }
}
