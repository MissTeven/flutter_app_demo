package com.example.testflutterapp;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

import java.util.Observable;
import java.util.concurrent.TimeUnit;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.StringCodec;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.reactivex.functions.Consumer;

public class MainFlutterActivity extends FlutterActivity {
    private static final String TAG = "MainFlutterActivity";
    private EventChannel.EventSink mEventSink;
    BasicMessageChannel messageChannel;

    public static void startAction(Context context) {
        Intent intent = new Intent(context, MainFlutterActivity.class);
        context.startActivity(intent);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        Log.d(TAG, "onCreate: ");

        new MethodChannel(getFlutterView(), "testGotoNativeActivity").setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                if (methodCall.method.equals("gotoNativeActivity")) {
                    NativeActivity.startActionForResult(MainFlutterActivity.this, 200);
                    result.success(1);
                }
            }
        });
        new EventChannel(getFlutterView(), "testEventChannel").setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object o, EventChannel.EventSink eventSink) {
                mEventSink = eventSink;
            }

            @Override
            public void onCancel(Object o) {
            }
        });

        messageChannel = new BasicMessageChannel<String>(getFlutterView(), "messageChannel", StringCodec.INSTANCE);
        messageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler<String>() {
            @Override
            public void onMessage(String s, BasicMessageChannel.Reply<String> reply) {
                if (s.length() > 0) {
                    Log.d(TAG, "收到来自flutter的消息: " + s);
                    reply.reply("");
                }
            }
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == 200 && resultCode == RESULT_OK) {
            mEventSink.success(1);
        }
    }
}
