enum RouteValue {
  splash(
    path: '/',
  ),
  home(
    path: '/home',
  ),
  calendar(
    path: 'calendar',
  ),
  info(
    path: 'info',
  ),
  task(
    path: 'task',
  ),
    pie(
    path: 'pie',
  ),
  unknown(
    path: '',
  );

  final String path;
  const RouteValue({
    required this.path,
  });
}
