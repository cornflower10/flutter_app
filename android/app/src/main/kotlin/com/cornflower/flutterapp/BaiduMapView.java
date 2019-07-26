package com.cornflower.flutterapp;

import android.view.View;

import com.baidu.mapapi.map.MapView;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;

/**
 * Created by xiejingbao on 2019/7/26.
 */
public class BaiduMapView implements PlatformView, MethodChannel.MethodCallHandler {
    private MapView mapView;
    public BaiduMapView(MapView mapView) {
        this.mapView = mapView;
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
//        methodCall.method
    }

    @Override
    public View getView() {
        return mapView;
    }

    @Override
    public void dispose() {

    }
}
