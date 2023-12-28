import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_curiosities/presentation/providers/pictures/pictures_providers.dart';

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
            title: Text('Astronomy Picture Of The Day',
                style: textStyles.titleLarge)),
        body: Column(
          children: [
            Image.network(apod.first.url),
            Text(apod.first.explanation ?? 'No explanation available',
                style: textStyles.bodyMedium)
          ],
        ));
  }
}
