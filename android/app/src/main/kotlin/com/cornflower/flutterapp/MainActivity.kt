package com.cornflower.flutterapp

import android.content.Intent
import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  private val CHANNEL = "samples.flutter.io/battery"
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
     MethodChannel(flutterView,CHANNEL).setMethodCallHandler{call ,result->

         var  intent = Intent(this,SecondActivity::class.java);
         intent.putExtra("main","flutter");
         startActivity(intent);
         result.success(null)
//         call = null;
     }
  }
}
