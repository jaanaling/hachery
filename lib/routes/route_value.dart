enum RouteValue {
  splash(
    path: '/',
  ),
  home(
    path: '/home',
  ),
  statistic(
    path: 'statistic',
  ),
  monitoring(
    path: 'monitoring',
  ),
  add(
    path: 'add',
  ),
  articles(
    path: 'articles',
  ),
  article(
    path: 'article',
  ),
  unknown(
    path: '',
  );

  final String path;
  const RouteValue({
    required this.path,
  });
}
