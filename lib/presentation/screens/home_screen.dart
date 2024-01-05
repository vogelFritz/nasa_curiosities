import 'package:flutter/material.dart';

import 'package:nasa_curiosities/presentation/widgets/home_swiper/home_swiper.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
            title: Center(
                child: Text('Navigate Through Nasa Stuff!',
                    style: textStyles.titleLarge, maxLines: 2))),
        body: const Column(
          children: [
            HomeSwiper(),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            Text('Presentación de la aplicación')
          ],
        ),
        drawer: const Column(
          children: [
            Icon(Icons.home_filled, color: Colors.white),
            SizedBox(height: 15),
            Icon(Icons.palette, color: Colors.white),
            SizedBox(height: 15),
            Icon(Icons.settings, color: Colors.white),
            SizedBox(height: 15),
            Icon(Icons.info, color: Colors.white)
          ],
        ));
  }
}
