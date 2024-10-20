enum RouteInfo {
  splash(name: 'splash', path: '/splash'),
  home(name: 'home', path: '/home');

  const RouteInfo({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;
}
