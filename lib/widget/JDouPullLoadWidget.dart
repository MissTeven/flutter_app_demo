import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class JDouPullLoadWidget extends StatefulWidget {
  final JDouPullLoadWidgetControl control;

  const JDouPullLoadWidget({Key key, this.control})
      : assert(control != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _JDouPullLoadWidgetState(this.control);
  }
}

class _JDouPullLoadWidgetState extends State<JDouPullLoadWidget>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<RefreshIndicatorState> _refreshKey =
      GlobalKey<RefreshIndicatorState>();

  final dataList = List();
  final _scrollController = ScrollController();
  final JDouPullLoadWidgetControl _control;
  int pageIndex = 0;
  VoidCallback scrollListener;
  bool isInit = true;

  _JDouPullLoadWidgetState(this._control)
      : assert(_control != null),
        super();

  @override
  void initState() {
    super.initState();

    ///增加滑动监听
    scrollListener = () {
      ///判断当前滑动位置是不是到达底部，触发加载更多回调
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (this._control.onLoadMore != null) {
          _loadMore();
        }
      }
    };
    _scrollController.addListener(scrollListener);

    ///Tip:通过_refreshKey来启动刷新
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshKey.currentState.show().then((e) {});
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshKey,
      child: ListView.builder(
        ///Tip：取消顶部状态栏留白
        padding: EdgeInsets.all(0),
        itemCount: _getItemCount(),
        physics: const AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          return _getItem(index);
        },
      ),
      onRefresh: _refresh,
    );
  }

  ///Tip:必须有Future<Null>返回,否则刷新后不会自动结束动画
  Future<Null> _refresh() {
    return _control.onRefresh().then((list) {
      _handleRefreshResult(list);
    });
  }

  _loadMore() {
    pageIndex++;
    _control.onLoadMore(pageIndex: pageIndex).then((list) {
      _handleLoadMoreResult(list);
    });
  }

  ///根据配置状态返回实际列表渲染Item
  _getItem(int index) {
    if (_control.headerBuilder == null && dataList.length == 0) {
      return _buildEmpty();
    } else if (index == 0) {
      if (_control.headerBuilder != null) {
        return _control.headerBuilder();
      } else if (dataList.length > 0) {
        return _control.itemBuilder(item: dataList[index], index: index);
      }
    } else if (index < _getItemCount() - 2) {
      int position;
      if (_control.headerBuilder != null) {
        position = index - 1;
      } else {
        position = index;
      }
      return _control.itemBuilder(item: dataList[position], index: position);
    } else {
      if (_control.onLoadMore != null) {
        return _buildProgressIndicator();
      } else if (index < dataList.length) {
        return _control.itemBuilder(
            item: dataList[dataList.length - 1], index: dataList.length - 1);
      }
    }
  }

  _getItemCount() {
    int count = dataList.length;

    if (!isInit && _control.headerBuilder != null) {
      count++;
    }
    if (dataList.length > 0 && _control.onLoadMore != null) {
      count++;
    }
    if (!isInit && _control.headerBuilder == null && dataList.length == 0) {
      count = 1;
    }
    print("item count" + count.toString());
    return count;
  }

  @override
// TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  Widget _buildProgressIndicator() {
    ///是否需要显示上拉加载更多的loading
    Widget bottomWidget = (_control.onLoadMore != null)
        ? new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                ///loading框
                new SpinKitRotatingCircle(
                    color: Theme.of(context).primaryColor),
                new Container(
                  width: 5.0,
                ),

                ///加载中文本
                new Text(
                  "加载更多",
                  style: TextStyle(
                    color: Color(0xFF121917),
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ])

        /// 不需要加载
        : new Container();
    return new Padding(
      padding: const EdgeInsets.all(20.0),
      child: new Center(
        child: bottomWidget,
      ),
    );
  }

  Widget _buildEmpty() {
    return new Container(
      height: MediaQuery.of(context).size.height - 100,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
//          FlatButton(
//            onPressed: () {},
//            child: new Image(
//                image: new AssetImage(GSYICons.DEFAULT_USER_ICON),
//                width: 70.0,
//                height: 70.0),
//          ),
          Container(
            child: Text("暂无数据"),
          ),
        ],
      ),
    );
  }

  void _handleRefreshResult(List list) {
    if (list != null) {
      setState(() {
        isInit = false;
        dataList.clear();
        dataList.addAll(list);
      });
    }
  }

  void _handleLoadMoreResult(List list) {
    if (list != null) {
      setState(() {
        dataList.addAll(list);
      });
    }
  }
}

class JDouPullLoadWidgetControl {
  ///是否需要头部
  ItemBuilderCallback headerBuilder;

  ///item渲染
  ItemBuilderCallback itemBuilder;

  ///下拉刷新回调
  RefreshCallback onRefresh;

  ///加载更多回调
  RefreshCallback onLoadMore;

  JDouPullLoadWidgetControl(
      {this.headerBuilder, this.itemBuilder, this.onRefresh, this.onLoadMore});
}

typedef RefreshCallback = Future<List> Function({int pageSize, int pageIndex});
typedef ItemBuilderCallback = Widget Function({dynamic item, int index});
