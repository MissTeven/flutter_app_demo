import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_flutter_app/common/string/JDouStringBase.dart';
import 'package:test_flutter_app/common/string/JDouStringEn.dart';
import 'package:test_flutter_app/common/string/JDouStringZh.dart';
///自定义多语言实现
class JDouLocalizations {
  final Locale locale;

  JDouLocalizations(this.locale);

  ///根据不同 locale.languageCode 加载不同语言对应
  ///JDouStringEn和JDouStringZh都继承了JDouStringBase
  static Map<String, JDouStringBase> _localizedValues = {
    'zh': new JDouStringZh(),
    'en': new JDouStringEn(),
  };

  JDouStringBase get currentLocalized {
    return _localizedValues[locale.languageCode];
  }

  ///通过 Localizations 加载当前的 JDouLocalizations
  static JDouLocalizations of(BuildContext context) {
    return Localizations.of(context, JDouLocalizations);
  }
}
