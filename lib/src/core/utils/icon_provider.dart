enum IconProvider {
  background(imageName: 'background.webp'),
  logo(imageName: 'logo.webp'),
  icon(imageName: 'icon.png'),
  back(imageName: 'back.png'),
  plus(imageName: 'plus.png'),
  minus(imageName: 'minus.png'),
  egg(imageName: 'egg.png'),
  temp(imageName: 'temp.png'),
  error(imageName: 'error.png'),
  water(imageName: 'water.png'),

  unknown(imageName: '');

  const IconProvider({
    required this.imageName,
  });

  final String imageName;
  static const _imageFolderPath = 'assets/images';

  String buildImageUrl() => '$_imageFolderPath/$imageName';
  static String buildImageByName(String name) => '$_imageFolderPath/$name';
}
