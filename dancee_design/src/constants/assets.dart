import 'package:flutter_svg/flutter_svg.dart';

String _assetPrefix = '';

enum AppIcons {
  calendar('assets/icons/calendar.svg'),
  check('assets/icons/check.svg'),
  clock('assets/icons/clock.svg'),
  dancers('assets/icons/dancers.svg'),
  map('assets/icons/map.svg'),
  point('assets/icons/point.svg');

  final String path;
  const AppIcons(this.path);

  String get pathWithPrefix => _assetPrefix + path;

  static set pathPrefix(String prefix) => _assetPrefix = prefix;

  SvgPicture get svg => SvgPicture.asset(pathWithPrefix);
}

class AppFonts {
  static const String inter = 'Inter';
}
