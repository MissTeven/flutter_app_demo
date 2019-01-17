package com.example.testflutterapp

import android.content.Intent
import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.util.Log
import io.reactivex.Observable
import java.util.concurrent.TimeUnit

class SplashActivity : AppCompatActivity() {
    private val TAG = "SplashActivity"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_splash)
        Observable.intervalRange(0, 3, 0, 1, TimeUnit.SECONDS).subscribe {
            if (it == 2L) {
                MainFlutterActivity.startAction(this@SplashActivity)
            }
        }
    }
}
