import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_flutter_app/common/config/Config.dart';
import 'package:test_flutter_app/page/TestPage.dart';

class DetailItemPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetailItemPageState();
  }
}

class _DetailItemPageState extends State<DetailItemPage> {
  final TextEditingController textEditingController =
      new TextEditingController();
  static const MethodChannel methodChannel = MethodChannel(
    'testGotoNativeActivity',
  );
  static const EventChannel eventChannel = EventChannel('testEventChannel');
  static const BasicMessageChannel<String> messageChannel =
      BasicMessageChannel<String>("messageChannel", StringCodec());

  _sendMsg() {
    String msg = textEditingController.text;
    if (msg.length > 0) {
      messageChannel.send(msg);
    }
  }

  Future<void> _gotoNextPage() async {
    try {
      final int result = await methodChannel.invokeMethod('gotoNativeActivity');
      if (result != 1) {
        print('Failed to gotoNextPage.');
      }
//      await methodChannel.invokeMethod('gotoNativeActivity');
    } on PlatformException {
      print('Failed to gotoNextPage.');
    }
  }

  @override
  void initState() {
    super.initState();
    eventChannel.receiveBroadcastStream().listen(_event);
    messageChannel.setMessageHandler(_handleNativeMsg);
  }

  Future<String> _handleNativeMsg(String message) async {
    print(message);
    return "";
  }

  void _event(event) {
    print(event);
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
      return TestPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("TEST"),
        actions: <Widget>[
          Icon(Icons.ac_unit),
          new Icon(IconData(0xe6d0, fontFamily: "wxcIconFont"), size: 16.0)
        ],
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new TextField(
              controller: textEditingController,
              decoration: InputDecoration(hintText: "请输入发往native的消息"),
            ),
            new RaisedButton(
              child: new Text("进入原生Activity"),
              onPressed: _gotoNextPage,
            ),
            new RaisedButton(
              child: new Text("发送消息"),
              onPressed: _sendMsg,
            )
          ],
        ),
      ),
    );
  }
}
