import 'dart:io';

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

  static setup() {
    _assetPrefix = 'packages/dancee_design/';
    //if (Platform.isIOS || Platform.isAndroid) {
    //  _assetPrefix = 'packages/dancee_design/';
    //} else {
    //  _assetPrefix = '../dancee_design/';
    //}
  }
}

class AppFonts {
  static const String inter = 'Inter';
}
