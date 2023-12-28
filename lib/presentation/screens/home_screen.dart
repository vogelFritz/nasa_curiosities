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
    return Scaffold(
        appBar: AppBar(title: const Text('Astronomy Picture Of The Day')),
        body: Image.network((apod.isEmpty)
            ? 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/330px-No-Image-Placeholder.svg.png?20200912122019'
            : apod.first.url));
  }
}
