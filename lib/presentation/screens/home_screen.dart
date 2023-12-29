import 'package:flutter/material.dart';

import 'package:nasa_curiosities/presentation/widgets/bottom_navigation_bar.dart';
import 'package:nasa_curiosities/presentation/widgets/home_swiper/home_swiper.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
            title:
                Center(child: Text('Welcome', style: textStyles.titleLarge))),
        body: const HomeSwiper(),
        bottomNavigationBar: const CustomBottomNavBar());
    //SingleChildScrollView(
    //    physics: const BouncingScrollPhysics(),
    //    child: Apod(apod: apod.first)));
  }
}
