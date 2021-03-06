import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_app/localization/JDouLocalizations.dart';

/**
 * 多语言代理
 * Created by guoshuyu
 * Date: 2018-08-15
 */
class JDouLocalizationsDelegate
    extends LocalizationsDelegate<JDouLocalizations> {
  JDouLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    ///支持中文和英语
    return ['en', 'zh'].contains(locale.languageCode);
  }

  ///根据locale，创建一个对象用于提供当前locale下的文本显示
  @override
  Future<JDouLocalizations> load(Locale locale) {
    return new SynchronousFuture<JDouLocalizations>(
        new JDouLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<JDouLocalizations> old) {
    return false;
  }

  ///全局静态的代理
  static JDouLocalizationsDelegate delegate = new JDouLocalizationsDelegate();
}
