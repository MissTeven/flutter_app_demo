package com.example.testflutterapp;

import android.Manifest;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.util.Log;
import android.widget.Toast;

import com.example.testflutterapp.event.PushEvent;

import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;

import java.util.Map;
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
    private MethodChannel permissionMethodChannel;

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
//        permissionMethodChannel =
//                new MethodChannel(getFlutterView(), "simple_permissions");
//        permissionMethodChannel.setMethodCallHandler(new MethodChannel.MethodCallHandler() {
//            @Override
//            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
//                if (methodCall.method.equals("requestPermission")) {
//                    Map<String, String> arguments = (Map<String, String>) methodCall.arguments;
//                    String permission = arguments.get("permission");
//                    if (ContextCompat.checkSelfPermission(MainFlutterActivity.this, Manifest.permission.WRITE_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED) {
//                        Toast.makeText(MainFlutterActivity.this, "权限已经授权", Toast.LENGTH_SHORT).show();
//                        result.success(PackageManager.PERMISSION_GRANTED);
//                    } else {
//                        ActivityCompat.requestPermissions(MainFlutterActivity.this,
//                                new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE},
//                                201);
//                    }
////                    result.success(ContextCompat.checkSelfPermission(MainFlutterActivity.this, "android.permission." + permission));
//                }
//            }
//        });
        EventBus.getDefault().register(this);

    }

    @Override
    protected void onDestroy() {
        EventBus.getDefault().unregister(this);
        super.onDestroy();
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == 200 && resultCode == RESULT_OK) {
            mEventSink.success(1);
        }
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void onAcceptEvent(PushEvent event) {
        if (mEventSink != null) {
            mEventSink.success(event.toString());
        }
    }

//    @Override
//    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
//        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
//        if (requestCode == 201) {
//            if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
//                Toast.makeText(MainFlutterActivity.this, "权限已经授权", Toast.LENGTH_SHORT).show();
//            }
//        }
//    }
}
