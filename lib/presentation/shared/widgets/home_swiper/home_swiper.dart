import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:card_swiper/card_swiper.dart';

import 'package:nasa_curiosities/presentation/shared/widgets/home_swiper/home_swiper_items/apod_swiper_item.dart';
import 'package:nasa_curiosities/presentation/shared/widgets/home_swiper/home_swiper_items/mars_photos_swiper_item.dart';
import '../../../providers/providers.dart';

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
    final apod = ref.watch(apodProvider);
    final marsPhotos = ref.watch(marsPhotosProvider);
    final List<Widget> swiperItems = [
      (apod.title == 'No title')
          ? const Center(child: CircularProgressIndicator())
          : ApodSwiperItem(apod: apod),
      (marsPhotos.isEmpty)
          ? const Center(child: CircularProgressIndicator())
          : MarsPhotosSwiperItem(marsPhoto: marsPhotos.first)
    ];
    final List<String> screenPaths = ['/apod-screen', '/mars-photos-screen'];
    return SizedBox(
      height: 510,
      width: double.infinity,
      child: Swiper(
          pagination: const SwiperPagination(),
          onTap: (index) {
            context.push(screenPaths[index]);
          },
          autoplay: true,
          loop: false,
          viewportFraction: 0.8,
          scale: 0.9,
          itemCount: swiperItems.length,
          itemBuilder: (context, index) => Center(
              child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  child: swiperItems[index]))),
    );
  }
}
