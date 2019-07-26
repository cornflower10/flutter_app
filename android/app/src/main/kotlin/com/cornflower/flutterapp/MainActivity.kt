package com.cornflower.flutterapp

import android.os.Bundle
import com.baidu.mapapi.map.MapView
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.BasicMessageChannel



class MainActivity : FlutterActivity() {
    private val CHANNEL = "baiduMap"
    lateinit var address: String
    lateinit var messageChannel2: BasicMessageChannel<Any>
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val mapView = MapView(this)
        MapRegistrant.registerWith(this, mapView)
//        GeneratedPluginRegistrant.registerWith(this)
////        val messageChannel = BasicMessageChannel(flutterView, CHANNEL, StandardMessageCodec.INSTANCE)
////
////// 接收消息监听
////        messageChannel.setMessageHandler { o, reply ->
//////            println("onMessage: $o")
//////            reply.reply("返回给flutter的数据")
////            var  intent = Intent(this,SecondActivity::class.java);
////         startActivityForResult(intent,99)
////        }
//        messageChannel2 =
//                BasicMessageChannel(flutterView,
//                        CHANNEL, StandardMessageCodec.INSTANCE)
//
//        MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
//
//            var intent = Intent(this, SecondActivity::class.java)
//            startActivityForResult(intent, 99)
////         call = null;
//        }

//        var  intent = Intent(this,SecondActivity::class.java)
//        startActivityForResult(intent,99)
    }

//    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
//        super.onActivityResult(requestCode, resultCode, data)
//        if (resultCode == Activity.RESULT_OK) {
//            address = data?.getStringExtra("address").toString()
//
//            messageChannel2.send(address) { o -> println("onReply: $o") }
//
//        }
//        finish()
//    }
}
