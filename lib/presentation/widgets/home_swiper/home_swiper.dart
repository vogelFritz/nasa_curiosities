import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_curiosities/presentation/widgets/home_swiper/apod_swiper_item.dart';

import '../../providers/pictures/pictures_providers.dart';

class HomeSwiper extends ConsumerWidget {
  const HomeSwiper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apod = ref.watch(apodProvider).first;
    return Swiper(
      autoplay: true,
      scale: 0.8,
      itemCount: 1,
      itemBuilder: (context, index) => Apod(apod: apod),
    );
  }
}
