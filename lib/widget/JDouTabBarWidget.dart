import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:test_flutter_app/common/config/Config.dart';

class JDouTabBarWidget extends StatefulWidget {
  ///底部模式type
  static const int BOTTOM_TAB = 1;

  ///顶部模式type
  static const int TOP_TAB = 2;

  final int type;

  final List<Widget> tabItems;

  final List<Widget> tabViews;

  final Color backgroundColor;

  final Color indicatorColor;

  final AppBar appBar;

  final Widget drawer;

  final Widget floatingActionButton;

  final TarWidgetControl tarWidgetControl;

  final PageController pageControl;

  final ValueChanged<int> onPageChanged;

  JDouTabBarWidget(
      {Key key,
      this.type,
      this.tabItems,
      this.tabViews,
      this.backgroundColor,
      this.indicatorColor,
      this.appBar,
      this.drawer,
      this.floatingActionButton,
      this.tarWidgetControl,
      this.pageControl,
      this.onPageChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _JDouTabBarWidgetState(
        type,
        tabItems,
        tabViews,
        backgroundColor,
        indicatorColor,
        appBar,
        drawer,
        floatingActionButton,
        tarWidgetControl,
        pageControl,
        onPageChanged);
  }
}

class _JDouTabBarWidgetState extends State<JDouTabBarWidget>
    with SingleTickerProviderStateMixin {
  final int _type;

  final List<Widget> _tabItems;

  final List<Widget> _tabViews;

  final Color _backgroundColor;

  final Color _indicatorColor;

  final AppBar _appBar;

  final Widget _drawer;

  final Widget _floatingActionButton;

  final TarWidgetControl _tarWidgetControl;

  final PageController _pageController;

  final ValueChanged<int> _onPageChanged;

  TabController _tabController;

  _JDouTabBarWidgetState(
      this._type,
      this._tabItems,
      this._tabViews,
      this._backgroundColor,
      this._indicatorColor,
      this._appBar,
      this._drawer,
      this._floatingActionButton,
      this._tarWidgetControl,
      this._pageController,
      this._onPageChanged)
      : super();

  @override
  void initState() {
    super.initState();
    _tabController =
        new TabController(length: widget.tabItems.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_type == JDouTabBarWidget.TOP_TAB) {
      return new Scaffold(
          floatingActionButton: _floatingActionButton,
          backgroundColor: _backgroundColor,
          persistentFooterButtons:
              _tarWidgetControl == null ? [] : _tarWidgetControl.footerButton,
          drawer: _drawer,
          appBar: new AppBar(
            title: _appBar.title,
            backgroundColor: Theme.of(context).primaryColor,
            bottom: new TabBar(
              tabs: _tabItems,
              controller: _tabController,
              indicatorColor: _indicatorColor,
            ),
          ),
          body: new PageView(
            children: _tabViews,
            controller: _pageController,
            onPageChanged: (index) {
              _tabController.animateTo(index);
              _onPageChanged?.call(index);
            },
          ));
    }
    return new Scaffold(
      drawer: _drawer,
      appBar: _appBar,
      body: new TabBarView(children: _tabViews, controller: _tabController),
      bottomNavigationBar: new Material(
        color: Theme.of(context).primaryColor,
        child: new TabBar(
            tabs: _tabItems,
            unselectedLabelColor: Color.fromARGB(180, 225, 225, 225),
            controller: _tabController,
            indicatorColor: _indicatorColor),
      ),
    );
  }
}

class TarWidgetControl {
  List<Widget> footerButton = [];
}
