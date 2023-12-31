import 'package:go_router/go_router.dart';
import 'package:nasa_curiosities/presentation/screens/mars_photos_screen.dart';
import 'package:nasa_curiosities/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen()),
  GoRoute(
      path: '/apod-screen',
      name: ApodScreen.name,
      builder: (context, state) => const ApodScreen()),
  GoRoute(
      path: '/mars-photos-screen',
      name: MarsPhotosScreen.name,
      builder: (context, state) => const MarsPhotosScreen())
]);
