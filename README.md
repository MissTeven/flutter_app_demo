# test_flutter_app

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.



一、Flutter框架概览
===================

序号 | 版本号 | 修改内容 | 修改人 | 审核人 |修改日期
---|---|---|---|---|---
 1 | v1.0| 初始版本| 陆贺|     | 2019.01.23


Flutter是什么?
--------------

Flutter是一款移动应用程序SDK，一份代码可以同时生成iOS和Android两个高性能、高保真的应用程序;

Flutter包括一个现代的响应式框架、一个2D渲染引擎、现成的widget和开发工具。

Flutter框架是一个分层的结构，每个层都建立在前一层之上，框架的上层比下层的使用频率更高。例如，Material层是通过组合来自Widget层的基本Widget来构建的，
Widgets层本身是通过较低级对象渲染层构建的。

![![](media/image1.png){width="5.758333333333334in"
height="3.451388888888889in"}](https://github.com/xintanggithub/res/blob/master/2E1DFEE7-8551-4738-80BE-705A0A6DA484.png?raw=true)

Flutter有什么优势？
-------------------

1.  同一份代码开发iOS和Android

2.  创建美观，高度定制的用户体验

3.  受益于使用Flutter框架提供的丰富的Material
    Design和Cupertino（iOS风格）的widget实现定制、美观、品牌驱动的设计，而不受原生控件的限制

核心原则：一切皆为widget
------------------------

一、Widget是Flutter应用程序用户界面的基本构建块，与其他框架将视图、控制器、布局和其他属性分离不同，Flutter具有一致的统一对象模型：widget

Widget可以被定义为:

1.  一个结构元素（如按钮或菜单）

2.  一个文本样式元素（如字体或颜色方案）

3.  布局的一个方面（如填充）

4.  等等...

    Widget根据布局形成一个层次结构，每个widget嵌入其中，并继承其父项的属性。没有单独的"应用程序"对象，根widget扮演着这个角色。

![image](https://github.com/xintanggithub/res/blob/master/C4BE089F-856F-4D62-A789-1856A3B60DAB.png?raw=true)

二、组合 \> 集成

Widget本身通常由许多更小的、单一用途widget组成，这些widget结合起来产生强大的效果。

类层次结构很浅且很宽，可以最大限度地增加可能的组合数量。


可以通过与其他widget组合来控制widget的布局。栗子，如要将widget居中，可以将其封装在Center
widget中，布局widget没有自己的可视化表示。相反，他们唯一的目的是控制另一个widget布局的某些方面。

三、构建widget

可以通过实现widget的[build](https://docs.flutter.io/flutter/widgets/StatelessWidget/build.html)返回widget树（或层次结构）来定义widget的独特特征，这棵树更具体地表示了用户界面的widget层次。

widget的构建函数一般没有副作用。每当它被要求构建时，widget应该返回一个新的widget树，无论widget以前返回的是什么。
Framework会将之前的构建与当前构建进行比较并确定需要对用户界面进行哪些修改。

四、处理用户交互

widget需要根据用户交互或其他因素进行更改，则该widget是有状态的。

这些widget将继承[StatefulWidget](https://docs.flutter.io/flutter/widgets/StatefulWidget-class.html)（而不是[State](https://docs.flutter.io/flutter/widgets/State-class.html)）并将它们的可变状态存储在State的子类中；

1.  每当你改变一个State对象时（例如增加计数器），你必须调用setState()来通知框架，框架会再次调用State的构建方法来更新用户界面；

2.  父widget可以自由地创造子widget的新实例且不会失去子widget的状态，而不是通过持有子widget来维持其状态。

    ![image](https://github.com/xintanggithub/res/blob/master/6F4521AC-C411-4BF4-8588-51A1739BBB96.png?raw=true)

二、Flutter Widget框架概述
===========================

介绍
----

Flutter Widget采用现代响应式架构，从
[React](http://facebook.github.io/react/)
中获得灵感，用widget构建你的UI，描述视图在给定其当前配置和状态时的样子。当widget状态发生变化时，widget会重新构建UI，Flutter会对比前后变化的不同，
确定底层渲染树从一个状态转换到下一个状态所需的最小更改。

组件列表：https://flutterchina.club/widgets

常用基础 Widget
---------------

1、[Text](https://docs.flutter.io/flutter/widgets/Text-class.html)：该
widget 可让创建一个带格式的文本。

2、[Row](https://docs.flutter.io/flutter/widgets/Row-class.html)、
[Column](https://docs.flutter.io/flutter/widgets/Column-class.html)：（和Android中的LinearLayout相似）这些具有弹性空间的布局类Widget可让您在水平（Row）和垂直（Column）方向上创建灵活的布局。


```
Column(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: <Widget>[
Text('We move under cover and we move as one'),
Text('Through the night, we have one shot to live another day'),
Text('We cannot let a stray gunshot give us away')),
],)
```


3、[Stack](https://docs.flutter.io/flutter/widgets/Stack-class.html)：（和Android中的framelayout相似）可以使用
[Positioned](https://docs.flutter.io/flutter/widgets/Positioned-class.html)
来定位他们相对于Stack的上下左右四条边的位置。

4、[Container](https://docs.flutter.io/flutter/widgets/Container-class.html)：（容器组件）[Container](https://docs.flutter.io/flutter/widgets/Container-class.html)
可创建矩形视觉元素，
可以装饰为一个[BoxDecoration](https://docs.flutter.io/flutter/painting/BoxDecoration-class.html),
如 background、一个边框、或者一个阴影，
也可以具有边距（margins）、填充(padding)和应用于其大小的约束(constraints)。另外，还可以使用矩阵在三维空间中对其进行变换。


```
new Container(
	// 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
	height: 56.0,
	padding: const EdgeInsets.symmetric(horizontal: 8.0),
	decoration: new BoxDecoration(color: Colors.blue[500]),
	// Row 是水平方向的线性布局（linear layout）
	child: new Row(
	//列表项的类型是 <Widget>
	children: <Widget>[
	new IconButton(
	icon: new Icon(Icons.menu),
	tooltip: 'Navigation menu',
					// null 会禁用 button
					onPressed: null,
					),
					// 填满剩下全部可用空间
					new Expanded(
					child: title,
					),
					new IconButton(
					icon: new Icon(Icons.search),
					tooltip: 'Search',
					onPressed: null,
					),
					],  ),
					； );
```


注：

请确保在pubspec.yaml文件中，将flutter的值设置为：uses-material-design:
true。这允许我们可以使用一组预定义[Material
icons](https://design.google.com/icons/)。


```
flutter:
        uses-material-design: true
```


Material 组件
-------------

Flutter提供了许多widgets，可构建遵循Material
Design的应用程序。Material应用程序以[MaterialApp](https://docs.flutter.io/flutter/material/MaterialApp-class.html)
widget开始，
该widget在应用程序的根部创建了一些有用的widget，其中包括一个[Navigator](https://docs.flutter.io/flutter/widgets/Navigator-class.html)，
它管理由字符串标识的Widget栈（即页面路由栈）。[Navigator](https://docs.flutter.io/flutter/widgets/Navigator-class.html)可以让您的应用程序在页面之间的平滑的过渡。
是否使用[MaterialApp](https://docs.flutter.io/flutter/material/MaterialApp-class.html)完全是可选的，但是使用它是一个很好的做法。


```
MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
    primarySwatch: Colors.blue,
    ),
    routes: {MainPage.sName: (context) => MainPage()},
    ));
```


高度封装的页面组件Scaffold，可直接设置抽屉、AppBar、内容页、底部导航


```
new Scaffold(
drawer: _drawer,
appBar: _appBar,
body: new TabBarView(
		children: _tabViews,
		controller: _tabController
	),
	bottomNavigationBar: new Material(
	color: Theme.of(context).primaryColor,
	child: new TabBar(
	tabs: _tabItems,
	unselectedLabelColor: Color.fromARGB(180, 225, 225, 225),
	controller: _tabController,        indicatorColor: _indicatorColor),
	),
	);
```


RefreshIndicator实现列表页的下拉刷新


```
 RefreshIndicator(
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
 onRefresh: _refresh,);
```


处理手势[GestureDetector](https://docs.flutter.io/flutter/widgets/GestureDetector-class.html)
----------------------------------------------------------------------------------------------

[GestureDetector](https://docs.flutter.io/flutter/widgets/GestureDetector-class.html)
widget并不具有显示效果，用于检测用户做出的手势。
当用户点击[Container](https://docs.flutter.io/flutter/widgets/Container-class.html)时，
[GestureDetector](https://docs.flutter.io/flutter/widgets/GestureDetector-class.html)会调用它的[onTap](https://docs.flutter.io/flutter/widgets/GestureDetector-class.html#onTap)回调，
可以使用[GestureDetector](https://docs.flutter.io/flutter/widgets/GestureDetector-class.html)来检测各种输入手势，包括点击、拖动和缩放。


```
GestureDetector(
child: Card(
child: Container(
height: 100,
margin: EdgeInsets.all(0),
child: Text("Test" + index.toString()),
),
color: Colors.amber,
),
onTap: () {
_showDetail(context, item);
},
)
```


[InkWell](https://docs.flutter.io/flutter/material/InkWell-class.html)
遵循Material
Design指南的应用程序时，我们希望在点击时将水波动画添加到Widgets


```
InkWell(
child: Card(
child: Container(...)
),
onTap: () {
_showDetail(context, item);
},
);;
```


根据用户输入改变widget
----------------------

无状态的widget从它们的父widget接收参数，
它们被存储在[final](https://www.dartlang.org/docs/dart-up-and-running/ch02.html#final-and-const)型的成员变量中。
当一个widget被要求构建时，它使用这些存储的值作为参数来构建widget

StatefulWidget和State是单独的对象具有不同的生命周期：
Widget是临时对象，用于构建当前状态下的应用程序，而State对象在多次调用[build()](https://docs.flutter.io/flutter/widgets/State/build.html)之间保持不变，允许记住widget的信息(状态)。

事件流是"向上"传递的，而状态流是"向下"传递的，重定向这一流程的共同父元素是State。


```
class CounterIncrementor extends StatelessWidget {
CounterIncrementor({this.onPressed});
final VoidCallback onPressed;
@override
Widget build(BuildContext context) {
return new RaisedButton(
onPressed: onPressed,
child: new Text('Increment'),
);
}

}
class Counter extends StatefulWidget {
@override
_CounterState createState() => new _CounterState();
}
class _CounterState extends State<Counter> {
int _counter = 0;
void _increment() {
setState(() {
++_counter;
});
	 }
 @override
 Widget build(BuildContext context) {
 return new Row(children: <Widget>[
 new CounterIncrementor(onPressed: _increment),
 new CounterDisplay(count: _counter),
 ]);
 }

}
```


响应widget生命周期事件
----------------------

在StatefulWidget调用createState之后，框架将新的状态对象插入树中，然后调用状态对象的[initState](https://docs.flutter.io/flutter/widgets/State-class.html#initState)。
子类化State可以重写[initState](https://docs.flutter.io/flutter/widgets/State-class.html#initState)，以完成仅需要执行一次的工作。
例如，您可以重写initState以配置动画或订阅platform
services。initState的实现中需要调用super.initState。

当一个状态对象不再需要时，框架调用状态对象的[dispose](https://docs.flutter.io/flutter/widgets/State-class.html#dispose)。
您可以覆盖该[dispose](https://docs.flutter.io/flutter/widgets/State-class.html#dispose)方法来执行清理工作。例如，您可以覆盖[dispose](https://docs.flutter.io/flutter/widgets/State-class.html#dispose)取消定时器或取消订阅platform
services。
dispose典型的实现是直接调用[super.dispose](https://docs.flutter.io/flutter/widgets/State-class.html#dispose)。

key
---

1.  可以使用key来控制框架将在widget重建时与哪些其他widget匹配；

2.  可以使用全局key来唯一标识子widget。全局key在整个widget层次结构中必须是全局唯一的，这与局部key不同，后者只需要在同级中唯一。由于它们是全局唯一的，因此可以使用全局key来检索与widget关联的状态。

三、在Flutter中发起HTTP网络请求
===============================

http支持位于[dart:io](https://docs.flutter.io/flutter/dart-io/dart-io-library.html)，所以要创建一个HTTP
client， 我们需要在pubspec.yaml里添加dio依赖并导入：import \'dart:io\';


```
dependencies:
flutter:
sdk: flutter
......
dio: ^1.0.6
```


httpClient = new HttpClient();

该 client 支持常用的HTTP操作, such as
[GET](https://docs.flutter.io/flutter/dart-io/HttpClient/getUrl.html),
[POST](https://docs.flutter.io/flutter/dart-io/HttpClient/postUrl.html),
[PUT](https://docs.flutter.io/flutter/dart-io/HttpClient/putUrl.html),
[DELETE](https://docs.flutter.io/flutter/dart-io/HttpClient/deleteUrl.html).

处理异步
--------

HTTP API 在返回值中使用了[Dart
Futures](https://www.dartlang.org/tutorials/language/futures)。
我们建议使用async/await语法来调用API。

网络调用通常遵循如下步骤：

1.  创建 client.

2.  构造 Uri.

3.  发起请求, 等待请求，同时您也可以配置请求headers、 body。

4.  关闭请求, 等待响应.

5.  解码响应的内容.


```
//[ url] 请求url
///[ params] 请求参数
///[ header] 外加头
///[ option] 配置
static netFetch(url, params, Map<String, String> header, Options option,
{noTip = false}) async {
//有网络的情况下执行
Map<String, String> headers = new HashMap();
if (header != null) {
headers.addAll(header);
}
if (option != null) {
option.headers = headers;
} else {
option = new Options(method: "get");
option.headers = headers;
}
///超时
option.connectTimeout = 15000;
Dio dio = new Dio();
Response response;
try {
response = await dio.request(url, data: params, options: option);
} on DioError catch (e) {
Response errorResponse;
if (e.response != null) {
errorResponse = e.response;
} else {
errorResponse = new Response(statusCode: 666);
}
if (e.type == DioErrorType.CONNECT_TIMEOUT) {
errorResponse.statusCode = Code.NETWORK_TIMEOUT;
}
if (Config.DEBUG) {
print('请求异常: ' + e.toString());
print('请求异常url: ' + url);
}
}
return response;
}
```


四、解码和编码JSON
==================

[两个常规策略]{.underline}：

1.  手动序列化和反序列化，适用于小型项目。

2、通过代码生成自动序列化和反序列化，适用于中大型项目。

使用 dart:convert手动序列化JSON
-------------------------------

解码简单的JSON字符串并将响应解析为Map：


```
Map data = JSON.decode(responseBody);
// Assume the response body is something like: ['foo', { 'bar': 499 }]
int barValue = data[1]['bar']; // barValue is set to 499
```


对简单的JSON进行编码，请将简单值（字符串，布尔值或数字字面量）或包含简单值的Map，list等传给encode方法:


```
String encodedString = JSON.encode([1, 2, { 'a': null }]);
```


使用json\_annotation+json\_serializable自动序列化JSON
-----------------------------------------------------

在pubspec.yaml文件里dependencies下添加
json\_annotation，dev\_dependencies下添加json\_serializable依赖库，在项目根文件夹中运行
flutter packages get (或者在编辑器中点击 "Packages Get")
以在项目中使用这些新的依赖项。


```
dependencies:
# Your other regular dependencies here
json_annotation: ^0.2.2
dev_dependencies:
# Your other dev_dependencies here
json_serializable: ^0.5.8

```


栗子：


```
# step1
import 'package:json_annotation/json_annotation.dart';
# step5
part "User.g.dart";
# step2
@JsonSerializable()
class User extends Object with _$UserSerializerMixin {# step3
String name;
String address;
int age;
int sex;
# step6
User({this.name, this.address, this.age, this.sex});
factory User.fromJson(Map<String, dynamic> json) => 		_$UserFromJson(json);
}

```


注意，第四步执行命令行flutter packages pub run build\_runner build
\--delete-conflicting-outputs，结果如下自动生成一个\*.g.dart文件

![image](https://github.com/xintanggithub/res/blob/master/1FD4BF91-47A1-4519-B8E9-EA69E56608D1.png?raw=true)


```
// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'User.dart';
// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************
User _$UserFromJson(Map<String, dynamic> json) {
return new User(
name: json['name'] as String,
address: json['address'] as String,
age: json['age'] as int,
sex: json['sex'] as int);

}
abstract class _$UserSerializerMixin {
String get name;
String get address;
int get age;
int get sex;
Map<String, dynamic> toJson() => <String, dynamic>{
'name': name,
'address': address,
'age': age,
'sex': sex
};

}
```


使用json\_serializable模型
--------------------------


```
User user= TestBean.fromJson(response["data"]);
Map<String, dynamic> map = user.toJson();
```

五、数据存储
============

SharedPreferences
-----------------

SharedPreferences轻量级存储类，以键值对的形式保存设置，属性和数据。在Flutter平台我们使用shared\_preferences库来同时支持Android
和iOS。

第一，在pubspec.yaml 导入库shared\_preferences


```
dependencies:
flutter:
sdk: flutter
	......
	shared_preferences: ^0.4.2
```

第二，在使用SP的dart类中导入库


```
import 'package:shared_preferences/shared_preferences.dart';

```


3.  支持的数据类型 bool、int、double、string、stringList

```
Future<bool> setBool(String key, bool value) => _setValue('Bool', key
, value);
Future<bool> setInt(String key, int value) =>
_setValue('Int', key, value);
Future<bool> setDouble(String key, double value) =>
_setValue('Double', key, value);、
Future<bool> setString(String key, String value) =>
_setValue('String', key, value);
Future<bool> setStringList(String key, List<String> value) =>
_setValue('StringList', key, value);

```

4.  基本操作

<!-- -->

1.  增；


```
static save(String key, value) async {
SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.setString(key, value);
}

```


2.  删；


```
static remove(String key) async {
SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.remove(key);
}
```


3.  改（同增，覆盖原数据）；

4.  查；


```
static remove(String key) async {
SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.remove(key);
}
```

![image](https://github.com/xintanggithub/res/blob/master/4812C231-D54F-44FD-ABA4-BBDDEF511962.png?raw=true)

Redux
-------------------------------------------------------------------------------------

Redux 的概念是状态管理，使用单一数据，实现共享状态。

如图，Redux 的主要由三部分组成：

1、Action 用于定义一个数据变化的请求行为。

2、Reducer 用于根据 Action 产生新状态，一般是一个方法。

3、Store 用于存储和管理 state。

所以，一般流程为：

1.  Widget 绑定了 Store 中的 state 数据。

2、Widget 通过 Action 发布一个动作。

3、Reducer 根据 Action 更新 state。

4、更新 Store 中 state 绑定的 Widget。

接入步骤如下：

1.  在pubspec.yaml 导入库 flutter\_redux


```
dependencies:
flutter:
sdk: flutter
......
flutter_redux: ^0.5.2

```


第二、创建State文件，存储共享数据和实现旧数据转换appReducer()；分别创建各个共享数据的转换方法


```
https://github.com/xintanggithub/res/blob/master/DC25DDBD-E341-4664-BDD5-46ED2165D831.png?raw=true
```



```
class JDouState {
User user;///共享数据User
JDouState({this.user});
}
JDouState appReducer(JDouState state, action) {
return JDouState(
		///共享数据User的转化方法
		user: UserReducer(state.user, action)
	);
}

```



```
import 'package:redux/redux.dart';///import redux

final UserReducer = combineReducers<User>(
///存储不同action的转换方法
[TypedReducer<User, UpdateUserAction>(_updateActionUserReducer)])
;
///根据action进行数据转换
User _updateActionUserReducer(User user, UpdateUserAction action) {
User user = action.user;
if (user != null) {
UserProvider().insert(user);
}
return user;
}
///定义action
class UpdateUserAction {
User user;
UpdateUserAction(this.user);
}

```


第三、在main.dart文件里创建Store，初始化State


```
class MyApp extends StatelessWidget {
///创建store
final store = Store<JDouState>(appReducer,
///初始化state
	 initialState: JDouState(user: User.empty()));
	 @override
	 Widget build(BuildContext context) {
///通过StoreProvider应用store
return StoreProvider<JDouState>(
store: store,
child: MaterialApp(
title: 'Flutter Demo',
theme: ThemeData(
primarySwatch: Colors.blue,
),
routes: {MainPage.sName: (context) => MainPage()},
));
}
}
```


4.  将widget与State里面的数据进行绑定

<!-- -->

1.  使用StoreConnector绑定

\@override\
Widget build(BuildContext context) {


```
@override
Widget build(BuildContext context) {
///通过StoreConnector实现绑定
return StoreConnector<JDouState, User>(
///指明绑定的数据
converter: (store) => store.state.user,
builder: (context, user) {
return Column(
mainAxisAlignment: MainAxisAlignment.spaceAround,
children: <Widget>[
Text(
		user != null
		&& user.name != null
		&& user.name.length > 0? user.name
		: ""),
		],
		);
		},
		);
}

```


2.  使用StoreBuilder进行绑定,不需要指定具体的数据类型


```

@override
Widget build(BuildContext context) {
return new StoreBuilder<JDouState>(builder: (context, store) {
return Container(
child: Column(
mainAxisAlignment: MainAxisAlignment.spaceAround,
children: <Widget>[
new Container(
child: Text(store.state.user != null &&
store.state.user.name != null &&
store.state.user.name.length > 0
? store.state.user.name
: ""),
),
	......
	],
	),
	);
	});
}
```


5.  数据更改，触发更新


```
void _saveUserName(String text) {
if (text != null && text.length > 0) {
print("新的用户名：" + text);
User user = StoreProvider.of<JDouState>(context).state.user;
if (user == null) {
user = User();
}
user.name = text;

///触发更新
StoreProvider.of<JDouState>(context).dispatch(new 		UpdateUserAction(user));
}
}

```


数据库存储
----------

1.  在pubspec.yaml 导入库sqflite


```
dependencies:
flutter:
sdk: flutter
......
sqflite: ^0.12.2+1

```


2.  创建DBManager.dart用于数据库的初始化和关闭等操作，Provider类用于某一张表的数据操作

    ![image](https://github.com/xintanggithub/res/blob/master/0A741FA8-7D37-4CC8-AA3E-C1DC64514A02.png?raw=true)


```
///import sqlite
import 'package:sqflite/sqflite.dart';
class DBManager {
static const VERSION = 1;
static const DB_NAME = "flutter_app_demo.db";
static Database _database;
///初始化
static init() async {
var databasePath = await getDatabasesPath();
databasePath += (Platform.isIOS ? "/" : "") + DB_NAME;
_database = await openDatabase(databasePath, version: VERSION,
onCreate: (db, version) async {
final sql =
"CREATE TABLE Test (id INTEGER PRIMARY KEY,name TEXT,value INTEGER,num REAL)";
await db.execute(sql);
});
}
///获取当前数据库对象
static Future<Database> getDatabase() async {
if (_database == null) {
await init();
}
return _database;
}
///表是否存在 每一个 SQLite 数据库都有一个叫SQLITE_MASTER 的表
static Future<bool> isTableExits(String tableName) async {
await getDatabase();
final sql =
"select * from sqlite_master where type = 'table' and name = '$tableName'";
var res = await _database.rawQuery(sql);
return res != null && res.length > 0;
}
///关闭
static close() {
_database?.close();
_database = null;
}
}
```


创建Provider的基类


```
import 'package:test_flutter_app/common/db/DBManager.dart';
abstract class BaseProvider {
bool isTableExits = false;
createTableSql();
tableName();
createTableBaseSql(String name, String columnId) {
return "create table $name ($columnId integer primary key autoincrement, ";
}
@mustCallSuper
open() async {
if (!isTableExits) {
await prepare(tableName(), createTableSql());
}
return await DBManager.getDatabase();
}
@mustCallSuper
prepare(String name, String createSql) async {
isTableExits = await DBManager.isTableExits(name);
if (!isTableExits) {
var databse = await DBManager.getDatabase();
return await databse.execute(createSql);
}
}
getDataBase() async {
return await open();
}
}
```

举例创建用于User表的操作的UserProvider类，实现增、删、改、查


```
import 'package:sqflite/sqflite.dart';
import 'package:test_flutter_app/common/db/BaseProvider.dart';
import 'package:test_flutter_app/common/model/User.dart';
class UserProvider extends BaseProvider {
final name = "userInfo";
final columnId = "_ID";
final columnName = "name";
final columnAddress = "address";
final columnAge = "age";
final columnSex = "sex";
UserProvider() : super();
@override
createTableSql() {
return createTableBaseSql(name, columnId) +
"$columnName text,$columnAddress text,$columnAge 	integer,$columnSex integer)";
}

  @override
  tableName() {
  return name;
  }

  ///增
  Future insert(User user) async {
  Database database = await getDataBase();
  List<User> users = await query(user.name);
  if (users.length > 0) {
  await delete(user.name);
  }
  return database.insert(name, _toMap(user));
  }
  Map<String, dynamic> _toMap(User user) {
  Map<String, dynamic> map = {
  columnName: user.name,
  columnAddress: user.address,
  columnAge: user.age,
  columnSex: user.sex
  };
  return map;
  }

  ///删
  Future delete(String userName) async {
  Database database = await getDataBase();
  return database
  .delete(name, where: "$columnName = ?", whereArgs: [userName]);
  }

  ///改
Future update(String userName, Map map) async {
Database database = await getDataBase();
return  database.update(name, map, where: "$columnName = ?",
 whereArgs: 	[userName]);

}

  ///查
  Future<List<User>> query(String userName) async {
  Database database = await getDataBase();
  List<Map<String, dynamic>> result = await database
  .query(name, where: "$columnName=?", whereArgs: [userName]);
  var list = List<User>();
  if (result.length > 0) {
  for (int i = 0; i < result.length; i++) {
  Map<String, dynamic> it = result[i];
  User user = User.fromJson(it);
  list.add(user);
  }
  }
  return list;
  }
}
```


六、与原生交互
==============

从Android的角度出发的个人观点：flutter app 与
原生应用是一种嫁接关系，前者嫁接到原生应用的某一Activity上，flutter app
内的页面跳转实则是在同一Activity内View的转换，与原生的交互也就是与它所嫁接的Acticity的交互。三种交互方式MethodChannel、EventChannel、MessageChannel，

统称**Platform Channels。**

![image](https://github.com/xintanggithub/res/blob/master/2FD5C3C9-5D6A-45D3-982A-56832A5264DD.png?raw=true)

注：

为了保证UI的响应，通过Platform Channels传递的消息都是异步的

在Platform
Channels上传递的消息都是经过编码的，编码的方式也有几种，默认的是用StandardMethodCodec。其他的还有BinaryCodec（二进制的编码，其实啥也没干，直接把入参给返回了）,
JSONMessageCodec(JSON格式的编码)，StringCodec(String格式的编码)。这些编解码器允许的只能是以下这些类型：

![image](https://github.com/xintanggithub/res/blob/master/D56F4997-4903-48BA-8E8E-9179069EBF4B.png?raw=true)

所以，自定义的Object类型的一个实例直接扔给Platform
Channels传送是不行的。

MethodChannel
-------------

在native端FlutterActivity的onCreate方法里


```
/// testGotoNativeActivity，channel名称app内会有多个channel，所以名称需要设为App内唯一。
new MethodChannel(getFlutterView(), "testGotoNativeActivity")
.setMethodCallHandler(new MethodChannel.MethodCallHandler() {
@Override
public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
if (methodCall.method.equals("gotoNativeActivity")) {

	 /// 根据flutter app层传来的Method名称来实现方法
         NativeActivity.startActionForResult(
		MainFlutterActivity.this, 200);
	   /// 向flutter返回返回值
	   result.success(1);
	   }
	   }

});

```


在flutter端Widget的State类里

a.  创建MethodChannel


```
static const MethodChannel methodChannel =
MethodChannel('testGotoNativeActivity',);
```


b、调用invokeMethod方法与native层交互


```
if (result != 1) {
		print('Failed to gotoNextPage.');
		}
		} on PlatformException {
		print('Failed to gotoNextPage.');
		}
		}

```


注：

通过MethodChannel，Native也能调用Flutter的方法，这是一个[双向的通道]{.underline}。

在Flutter端给MethodChannel设置一个MethodCallHandler，在Native端，对应的channel调用invokeMethod。

MethodChannel提供了方法调用的通道，而如果Native有数据流需要传送给Flutter就要用到EventChannel了。

EventChannel
------------

在native端FlutterActivity的onCreate方法里

a、创建EventChannel，实现连接监听，拿到 EventChannel.EventSinkmEventSink
mEventSink


```
/// testEventChannel，channel名称，App内唯一。
new EventChannel(getFlutterView(),"testEventChannel")
.setStreamHandler(new EventChannel.StreamHandler() {

/// onListen是Flutter端开始监听这个channel时的回调，第二个参数 EventSink是用来传数据的载体。
@Override
public void onListen(Object o, EventChannel.EventSink eventSink) {
mEventSink = eventSink;
}
/// flutter层不再接收
@Override
public void onCancel(Object o) { }
});

```


b.  在需要的位置通过 mEventSink 传输数据


```
@Override
protected void onActivityResult(int requestCode, int resultCode,
Intent data) {
super.onActivityResult(requestCode, resultCode, data);
if (requestCode == 200 && resultCode == RESULT_OK) {
mEventSink.success(1);
}
}

```


在flutter端Widget的State类里

a.  创建EventChannel


```
static const EventChannel eventChannel = EventChannel('testEventChannel');

```


b、在initState的时候打开这个channel


```
@override
void initState() {
super.initState();
eventChannel.receiveBroadcastStream().listen(_event);
}
```


BasicMessageChannel
-------------------

在native端FlutterActivity的onCreate方法里

a.  创建EventChannel messageChannel，实现连接监听


```
BasicMessageChannel messageChannel;
@Override
protected void onCreate(Bundle savedInstanceState) {
super.onCreate(savedInstanceState);
messageChannel = new BasicMessageChannel<String>(getFlutterView()
, "messageChannel", StringCodec.INSTANCE);
messageChannel.setMessageHandler(new 				BasicMessageChannel.MessageHandler<String>() {
@Override
public void onMessage(String s, 			BasicMessageChannel.Reply<String> reply) {
if (s.length() > 0) {
Log.d(TAG, "收到来自flutter的消息: " + s);
}
}
});
}
```


b.  发送消息到flutter


```
messageChannel.send("我来自native层");

```


在flutter端Widget的State类里

a.  创建BasicMessageChannel对象messageChannel


```
static const BasicMessageChannel<String> messageChannel =
BasicMessageChannel<String>("messageChannel", StringCodec());

```


b.  在initState的时候为messageChannel设置消息处理监听


```
@override
void initState() {
super.initState();
messageChannel.setMessageHandler(_handleNativeMsg);
}

```


c、消息监听处理消息


```
Future _handleNativeMsg(String message) async {
print(message);
}
```


d、发送消息到native层


```
_sendMsg() {
String msg = textEditingController.text;
if (msg.length > 0) {
messageChannel.send(msg);
}
}
```


七、权限请求
============

1.  在pubspec.yam导入依赖库permission\_handler


```
dependencies:
flutter:
sdk: flutter
......
#提供了动态权限申请
permission_handler: '^2.1.2'

```


2.  import包


```
import 'package:permission_handler/permission_handler.dart';

```


3.  请求权限


```
void requestWriteExternalStorage() async {
Map<PermissionGroup, PermissionStatus> permissions =
await PermissionHandler().requestPermissions(
	[PermissionGroup.storage]);
	print(permissions[PermissionGroup.storage].toString());
}

```


4.  检查权限


```
void checkWriteExternalStorage() async {
PermissionStatus permission = await PermissionHandler()
.checkPermissionStatus(PermissionGroup.storage);
print(permission.toString());
}

```


5.  打开手机权限设置


```
void openAppPermissionSetting() async {
bool isOpened = await PermissionHandler().openAppSettings();
}

```


第六，可以申请的相关权限


```
enum PermissionGroup {
/// The unknown permission only used for return type, never
requested
unknown,
/// Android: Calendar
/// iOS: Calendar (Events)
calendar,
/// Android: Camera
/// iOS: Photos (Camera Roll and Camera)
camera,
/// Android: Contacts
/// iOS: AddressBook
contacts,
/// Android: Fine and Coarse Location
/// iOS: CoreLocation (Always and WhenInUse)
location,
/// Android: Microphone
/// iOS: Microphone
microphone,
/// Android: Phone
/// iOS: Nothing
phone,
/// Android: Nothing
/// iOS: Photos
photos,
/// Android: Nothing
/// iOS: Reminders
reminders,
/// Android: Body Sensors
/// iOS: CoreMotion
sensors,
/// Android: Sms
/// iOS: Nothing
sms,
/// Android: External Storage
/// iOS: Nothing
storage,
/// Android: Microphone
/// iOS: Speech
speech,
/// Android: Fine and Coarse Location
/// iOS: CoreLocation - Always
locationAlways,
/// Android: Fine and Coarse Location
/// iOS: CoreLocation - WhenInUse
locationWhenInUse,
/// Android: None
/// iOS: MPMediaLibrary
mediaLibrary
}
```


6.  权限状态


```
enum PermissionStatus {
/// Permission to access the requested feature is denied by the user.
denied,
/// The feature is disabled (or not available) on the device.
disabled,
/// Permission to access the requested feature is granted by the user.
granted,
/// The user granted restricted access to the requested feature
(only on iOS).
restricted,
/// Permission is in an unknown state
unknown
}
```


八、在Flutter中添加资源和图片
=============================

Flutter应用程序可以包含代码和
assets（有时称为资源）。asset是打包到程序安装包中的，可在运行时访问。常见类型的asset包括静态数据（例如JSON文件），配置文件，图标和图片（JPEG，WebP，GIF，动画WebP
/ GIF，PNG，BMP和WBMP）

Flutter使用[pubspec.yaml](https://www.dartlang.org/tools/pub/pubspec)文件（位于项目根目录），来识别应用程序所需的asset。

指定 assets
-----------

Flutter使用[pubspec.yaml](https://www.dartlang.org/tools/pub/pubspec)文件（位于项目根目录），来识别应用程序所需的asset。


```
assets:
- res/images/logo.png
- res/images/welcome.png
- res/images/default_img.png
```


Asset 变体（variant）
---------------------

构建过程支持asset变体的概念：不同版本的asset可能会显示在不同的上下文中。
在pubspec.yaml的assets部分中指定asset路径时，构建过程中，会在相邻子目录中查找具有相同名称的任何文件。这些文件随后会与指定的asset一起被包含在asset
bundle中。

例如，如果您的应用程序目录中有以下文件:

-   .../pubspec.yaml

-   .../graphics/my\_icon.png

-   .../graphics/background.png

-   .../graphics/dark/background.png

-   ...etc.

然后您的pubspec.yaml文件包含:

flutter:

assets:

\- graphics/background.png

那么这两个graphics/background.png和graphics/dark/background.png
将包含在您的asset bundle中。前者被认为是\_main
asset\_，后者被认为是一种变体（variant）。

在选择匹配当前设备分辨率的图片时，Flutter使用asset变体。

加载 images
-----------

Flutter可以为当前设备加载适合其分辨率的图像。

声明分辨率相关的图片assets

[AssetImage](https://docs.flutter.io/flutter/painting/AssetImage-class.html)
了解如何将逻辑请求asset映射到最接近当前设备像素比例的asset。为了使这种映射起作用，应该根据特定的目录结构来保存asset

-   .../image.png

-   .../Mx/image.png

-   .../Nx/image.png

-   ...etc.

其中M和N是数字标识符，对应于其中包含的图像的分辨率，也就是说，它们指定不同素设备像比例的图片

主资源默认对应于1.0倍的分辨率图片。看一个例子：

-   .../my\_icon.png

-   .../2.0x/my\_icon.png

-   .../3.0x/my\_icon.png

在设备像素比率为1.8的设备上，\.../2.0x/my\_icon.png
将被选择。对于2.7的设备像素比率，\.../3.0x/my\_icon.png将被选择。

如果未在Image控件上指定渲染图像的宽度和高度，以便它将占用与主资源相同的屏幕空间量（并不是相同的物理像素），只是分辨率更高。
也就是说，如果\.../my\_icon.png是72px乘72px，那么\.../3.0x/my\_icon.png应该是216px乘216px;
但如果未指定宽度和高度，它们都将渲染为72像素×72像素（以逻辑像素为单位）。

pubspec.yaml中asset部分中的每一项都应与实际文件相对应，但主资源项除外。当主资源缺少某个资源时，会按分辨率从低到的顺序去选择。

加载图片在widget的build方法中使用
[AssetImage](https://docs.flutter.io/flutter/painting/AssetImage-class.html)类。


```
Widget build(BuildContext context) {
// ...
return new DecoratedBox(
decoration: new BoxDecoration(
image: new DecorationImage(
image: new AssetImage('graphics/background.png'),
// ...
),
// ...
),
);
// ...
}
```


依赖包中的资源图片
------------------

要加载依赖包中的图像，必须给AssetImage提供package参数。

例如，假设您的应用程序依赖于一个名为"my\_icons"的包，它具有如下目录结构：

-   .../pubspec.yaml

-   .../icons/heart.png

-   .../icons/1.5x/heart.png

-   .../icons/2.0x/heart.png

-   ...etc.

然后加载图像，使用:


```
new AssetImage('icons/heart.png', package: 'my_icons')

```


九、国际化Flutter App
=====================================================================================================

Flutter
应用是默认不支持多语言的，即使用户在中文环境下，显示的文字仍然是英文，如图。

![image](https://github.com/xintanggithub/res/blob/master/87AB1114-383D-4E3B-8DF3-FD83FA4F0CCB.png?raw=true)

那如何将系统的这些组件国际化呢？

1.  在 pubspec.yaml 中添加如下依赖：

```
dependencies:
flutter:
sdk: flutter
......
flutter_localizations:
sdk: flutter

```

2.  在 main.dart 中 import 包：


```

import 'package:flutter_localizations
/flutter_localizations.dart';

```


第四，在 MaterialApp 的构造方法中给 localizationsDelegates 和
supportedLocales 两个可选参数赋值：


```
MaterialApp(
title: 'Flutter Demo',
home: new MyHomePage(title: 'Flutter Demo Home Page'),
  localizationsDelegates: [// 此处
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  ],
  supportedLocales: [// 此处
  const Locale('zh', 'CH'), // 中文
  const Locale('en', 'US'), // English
  // ... other locales the app supports
  ],
......  )
```


效果如图，发现这个 Dialog
中的文字是变成中文了，但背景中的 titlebar 的文字还是英文。

![image](https://github.com/xintanggithub/res/blob/master/D273B077-FEC1-465D-8D9B-75A90EC87CA4.png?raw=true)

home: **new** MyHomePage(title: \'Flutter Demo Home Page\'),

原因是flutter并不能自动翻译title的内容由英文到中文，

所以需要自己实现一个类似
GlobalMaterialLocalizations的类JDouLocalizations通过将多国文字资源进行整合来实现多语言。

多国文字资源文件

![image](https://github.com/xintanggithub/res/blob/master/EDB37B69-EF92-478D-8166-BCA7419F3F05.png?raw=true)


```
abstract class JDouStringBase {
String app_quit_tip;
String app_cancel;
String app_ok;}
```



```
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
///获取对应的 JDouStringBase
static JDouLocalizations of(BuildContext context) {
return Localizations.of(context, JDouLocalizations);
}
}
```


只要能拿到JDouLocalizations的对象实例，就可以调用它的currentLocalized
来获取对应的资源类进而获得字符串。

自定义完
JDouLocalizations以后，需要一个叫做LocalizationsDelegate的类来完成它的初始化，LocalizationsDelegate
是一个抽象类，需要我们去实现它：


```
import 'package:test_flutter_app/localization/JDouLocalizations.dart
';
/**
* 多语言代理
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
```


接着将JDouLocalizationsDelegate添加进 MaterialApp


```
MaterialApp(
title: 'Flutter Demo',
home: new MyHomePage(title: 'Flutter Demo Home Page'),

  localizationsDelegates: [
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
JDouLocalizationsDelegate.delegate,// 此处
],
supportedLocales: [
const Locale('zh', 'CH'), // 中文
const Locale('en', 'US'), // English
// ... other locales the app supports
],
......
)
```


介绍另一个 Weidget 的子类
Localizations，JDouLocalizationsDelegate这个类的对象虽然被传入了MaterialApp，但由于
MaterialApp 会在内部嵌套 Localizations 这个 Widget，而
LocalizationsDelegate 正是其构造方法必须的参数：


```
class Localizations extends StatefulWidget {
/// Create a widget from which localizations (like translated
strings) can be obtained.
Localizations({
Key key,
@required this.locale,
@required this.delegates,
this.child,
}) : assert(locale != null),
assert(delegates != null),
assert(delegates.any((LocalizationsDelegate<dynamic> delegate
) => delegate is LocalizationsDelegate<WidgetsLocalizations>)),
super(key: key);

```


而 JDouLocalizations的实例也是在 Localizations 中通过
JDouLocalizationsDelegate 实例化的。所以在应用中要使用
JDouLocalizations的实例自然是需要通过 Localizations 这个 Widget
来获取的，JDouLocalizations里有代码如下：


```
///通过 Localizations 加载当前的 JDouLocalizations
static JDouLocalizations of(BuildContext context) {
return Localizations.of(context, JDouLocalizations);
}

```


接下来就是真正使用
JDouLocalizations的时候了，在代码中将原来的字符串替换如下：


```
MaterialApp(
onGenerateTitle: (context){
return JDouLocalizations.of(context).currentLocalized.taskTitle;
// 	此处1
},
home: new MyHomePage(

    //title:
    //JDouLocalizations.of(context).currentLocalized.titleBarTitle,
	// 此处2
	),

  localizationsDelegates: [
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
JDouLocalizationsDelegate.delegate
],
supportedLocales: [
const Locale('zh', 'CH'), // 中文
const Locale('en', 'US'), // English
// ... other locales the app supports
],
......
)
```


注：

根据源码分析Localizations.of(context, JDouLocalizations)的context
需要是MaterialApp 内部的context，而Localizations 这个组件是在
MaterialApp 中被嵌套的，直接使用MaterialApp
的title属性传入的context是外部的，此时是无法找到 JDouLocalizations对象。

因此这里需要onGenerateTitle这个属性，它是通过传入内部context以回调的方式来获取JDouLocalizations对象的。对于MyHomePage，则是将
MyHomePage 构造方法中的 title 参数移除，直接在 AppBar 内部赋值。

至于他处使用多国资源如下：


```
/// 单击提示退出
Future<bool> _dialogExitApp(BuildContext context) {
return showDialog(
context: context,
builder: (context) => new AlertDialog(
content: new Text(	JDouLocalizations.of(context).currentLocalized.app_quit_tip),//此处
actions: <Widget>[
new FlatButton(
onPressed: () => Navigator.of(context).pop(false),
child: new Text(JDouLocalizations.of(context)
.currentLocalized
.app_cancel)),//此处
new FlatButton(
onPressed: () {
Navigator.of(context).pop(true);
},
child: new Text(
JDouLocalizations.of(context).currentLocalized.app_ok))//此处
],
));
}
```


至此，关于flutter app的基础资料整理已经完成。
