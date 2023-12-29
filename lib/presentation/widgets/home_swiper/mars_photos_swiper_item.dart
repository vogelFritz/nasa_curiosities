import 'package:flutter/material.dart';
import 'package:nasa_curiosities/domain/entities/mars_photo.dart';

class MarsPhotosSwiperItem extends StatelessWidget {
  final List<MarsPhoto> marsPhotos;
  const MarsPhotosSwiperItem({super.key, required this.marsPhotos});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Image.network(marsPhotos.first.imgSrc)],
    );
  }
}
