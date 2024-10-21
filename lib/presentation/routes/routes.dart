import 'package:go_router/go_router.dart';

import '../../app.dart';
import '../pages/home/home_page.dart';
import '../pages/splash/splash_page.dart';
import 'route_info.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RouteInfo.splash.path,
      name: RouteInfo.splash.name,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: RouteInfo.home.path,
      name: RouteInfo.home.name,
      builder: (context, state) => const HomePage(),
    ),
  ],
  initialLocation: RouteInfo.splash.path,
  navigatorKey: App.navigatorKey,
);
