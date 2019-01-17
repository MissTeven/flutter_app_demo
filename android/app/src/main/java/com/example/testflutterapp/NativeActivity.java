package com.example.testflutterapp;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;

public class NativeActivity extends AppCompatActivity {
    public static void startAction(Context context) {
        Intent intent = new Intent(context, NativeActivity.class);
        context.startActivity(intent);
    }

    public static void startActionForResult(Context context, int code) {
        Intent intent = new Intent(context, NativeActivity.class);
        ((Activity) context).startActivityForResult(intent, code);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_native);
        findViewById(R.id.btn_finish).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent();
                intent.putExtra("test", 1);
                NativeActivity.this.setResult(RESULT_OK, intent);
                NativeActivity.this.finish();
            }
        });
    }
}
