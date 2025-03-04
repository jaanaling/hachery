enum IconProvider {
  background(imageName: 'background.webp'),
  logo(imageName: 'logo.webp'),
  icon(imageName: 'icon.png'),
  greenButton(imageName: 'green_button.png'),
  unknown(imageName: '');

  const IconProvider({
    required this.imageName,
  });

  final String imageName;
  static const _imageFolderPath = 'assets/images';

  String buildImageUrl() => '$_imageFolderPath/$imageName';
  static String buildImageByName(String name) => '$_imageFolderPath/$name';
}
