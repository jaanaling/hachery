enum IconProvider {
  splash(imageName: 'splash.png'),
  icon(imageName: 'icon.png'),
  d1(imageName: 'd1.png'),
  d2(imageName: 'd2.png'),
  d3(imageName: 'd3.png'),
  d4(imageName: 'd4.png'),
  d5(imageName: 'd5.png'),
  back(imageName: 'back.svg'),
  stat(imageName: 'stat.svg'),
  back1(imageName: 'back1.png'),
  back2(imageName: 'back2.png'),
  circle(imageName: 'circle.png'),
  blue(imageName: 'blue.png'),
  green(imageName: 'green.png'),
  yellow(imageName: 'yellow.png'),
  unknown(imageName: '');

  const IconProvider({
    required this.imageName,
  });

  final String imageName;
  static const _imageFolderPath = 'assets/images';

  String buildImageUrl() => '$_imageFolderPath/$imageName';
  static String buildImageByName(String name) => '$_imageFolderPath/$name';
}
