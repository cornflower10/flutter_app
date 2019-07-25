package com.cornflower.flutterapp


import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import com.baidu.location.BDAbstractLocationListener
import com.baidu.location.BDLocation
import com.baidu.location.LocationClient
import kotlinx.android.synthetic.main.activity_second.*


class SecondActivity : AppCompatActivity() {
    lateinit var location :LocationClient
    var  address:String = ""
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_second)
        bmapView.map.isMyLocationEnabled = true
        location = LocationClient(this)

        location.registerLocationListener(MyLocationListener())
        location.start()
    }

    override fun onResume() {
        super.onResume()
        bmapView.onResume()
    }

    override fun onPause() {
        super.onPause()
        bmapView.onPause()
    }

    override fun onDestroy() {
        super.onDestroy()
        location.stop()
        bmapView.map.isMyLocationEnabled = false
        bmapView.onDestroy()
    }

   inner class MyLocationListener : BDAbstractLocationListener() {
        override fun onReceiveLocation(p0: BDLocation?) {
            TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
            this@SecondActivity.address = p0?.address?.address!!

        }

    }
}
