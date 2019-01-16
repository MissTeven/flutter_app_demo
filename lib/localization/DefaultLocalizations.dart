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
  ///GSYStringEn和GSYStringZh都继承了GSYStringBase
  static Map<String, JDouStringBase> _localizedValues = {
    'en': new JDouStringEn(),
    'zh': new JDouStringZh(),
  };

  JDouStringBase get currentLocalized {
    return _localizedValues[locale.languageCode];
  }

  ///通过 Localizations 加载当前的 GSYLocalizations
  ///获取对应的 GSYStringBase
  static JDouLocalizations of(BuildContext context) {
    return Localizations.of(context, JDouLocalizations);
  }
}
