import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_curiosities/presentation/providers/pictures/pictures_providers.dart';

import 'package:nasa_curiosities/presentation/widgets/apod_swiper_item.dart';
import 'package:nasa_curiosities/presentation/widgets/bottom_navigation_bar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String name = 'home-screen';
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(apodProvider.notifier).getApodPicture();
  }

  @override
  Widget build(BuildContext context) {
    final apod = ref.watch(apodProvider);
    final textStyles = Theme.of(context).textTheme;
    if (apod.isEmpty) {
      return Scaffold(
          body: Text('Apod no disponible', style: textStyles.displayLarge));
    }
    return Scaffold(
        appBar: AppBar(
            title:
                Center(child: Text('Welcome', style: textStyles.titleLarge))),
        body: Swiper(
          itemCount: 1,
          itemBuilder: (context, index) => Apod(apod: apod.first),
        ),
        bottomNavigationBar: const CustomBottomNavBar());
    //SingleChildScrollView(
    //    physics: const BouncingScrollPhysics(),
    //    child: Apod(apod: apod.first)));
  }
}
