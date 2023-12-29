import 'package:go_router/go_router.dart';
import 'package:nasa_curiosities/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen()),
  GoRoute(
      path: '/apod-screen',
      name: ApodScreen.name,
      builder: (context, state) => const ApodScreen())
]);
