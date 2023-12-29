import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_curiosities/presentation/screens/apod_screen.dart';
import 'package:nasa_curiosities/presentation/widgets/home_swiper/apod_swiper_item.dart';
import 'package:nasa_curiosities/presentation/widgets/home_swiper/mars_photos_swiper_item.dart';

import '../../providers/pictures/pictures_providers.dart';

class HomeSwiper extends ConsumerStatefulWidget {
  const HomeSwiper({super.key});

  @override
  ConsumerState<HomeSwiper> createState() => _HomeSwiperState();
}

class _HomeSwiperState extends ConsumerState<HomeSwiper> {
  @override
  void initState() {
    super.initState();
    ref.read(apodProvider.notifier).getApodPicture();
    ref.read(marsPhotosProvider.notifier).getMarsPhotos();
  }

  @override
  Widget build(BuildContext context) {
    final apodList = ref.watch(apodProvider);
    final marsPhotos = ref.watch(marsPhotosProvider);
    final List<Widget> swiperItems = [
      (apodList.isEmpty) 
      ? const Center(child: CircularProgressIndicator())
      : ApodSwiperItem(apod: apodList.first),
      (marsPhotos.isEmpty) 
      ? const Center(child: CircularProgressIndicator())
      : MarsPhotosSwiperItem(marsPhotos: marsPhotos)
    ];
    return SizedBox(
      height: 510,
      width: double.infinity,
      child: Swiper(
        pagination: const SwiperPagination(),
        onTap: (index) {
          context.pushNamed(ApodScreen.name);
        },
        autoplay: true,
        scale: 0.9,
        itemCount: swiperItems.length,
        itemBuilder: (context, index) => swiperItems[index],
      ),
    );
  }
}
