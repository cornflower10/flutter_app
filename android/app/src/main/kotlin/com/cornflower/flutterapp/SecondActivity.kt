package com.cornflower.flutterapp


import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import com.baidu.location.BDAbstractLocationListener
import com.baidu.location.BDLocation
import com.baidu.location.LocationClient
import com.baidu.location.LocationClientOption
import com.baidu.mapapi.map.BaiduMap
import com.baidu.mapapi.map.MapStatusUpdateFactory
import com.baidu.mapapi.map.MyLocationData
import com.baidu.mapapi.model.LatLng
import io.flutter.plugin.common.EventChannel
import kotlinx.android.synthetic.main.activity_second.*










class SecondActivity : AppCompatActivity() {
    lateinit var location: LocationClient
    var address: String = ""
    lateinit var eventChannel: EventChannel
    lateinit var bdMap: BaiduMap
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_second)
        bdMap = bmapView.map
        bdMap.isMyLocationEnabled = true
        location = LocationClient(this)
        location.registerLocationListener(MyLocationListener())


        //通过LocationClientOption设置LocationClient相关参数
        val option = LocationClientOption()
        option.isOpenGps = true // 打开gps
        option.setCoorType("bd09ll") // 设置坐标类型
        option.setScanSpan(5000)
        location.locOption = option
        location.start()


//        bt_ok.setOnClickListener {
//           intent.putExtra("address",address)
//           setResult(Activity.RESULT_OK,intent)
//            finish()
//        }
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

    inner class MyLocationListener: BDAbstractLocationListener() {

         var isFirstLoc:Boolean = true;
        override fun onReceiveLocation(location: BDLocation?) {
           //To change body of created functions use File | Settings | File Templates.
//            this@SecondActivity.address = p0?.address?.address!!
//            Log.i("SecondActivity", this@SecondActivity.address);
            val locData = location?.radius?.let {
                MyLocationData.Builder()
                        .accuracy(it)
                        // 此处设置开发者获取到的方向信息，顺时针0-360
                        .direction(location.getDirection()).latitude(location.getLatitude())
                        .longitude(location.getLongitude()).build()
            }
            this@SecondActivity.bdMap.setMyLocationData(locData)
            if(isFirstLoc){
                isFirstLoc = false

                val ll = LatLng(location!!.getLatitude(),
                        location.getLongitude())
                val u =
                MapStatusUpdateFactory.newLatLngZoom(ll,17f)
                this@SecondActivity.bdMap.animateMapStatus(u)
            }
        }

    }
}
