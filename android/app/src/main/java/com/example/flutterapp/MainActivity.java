package com.example.flutterapp;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build.VERSION_CODES;
import android.os.Build.VERSION;
import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugins.GeneratedPluginRegistrant;

import com.microsoft.appcenter.AppCenter;
import com.microsoft.appcenter.analytics.Analytics;
import com.microsoft.appcenter.crashes.Crashes;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "modules.flutter.dev/battery";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    AppCenter.start(getApplication(), "@string/appCenter_app_secret", Analytics.class, Crashes.class);
    new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler((methodCall, result) -> {
      if (methodCall.method.equals("getBatteryLevel")) {
        int batteryLevel = getBatteryLevel();

        if (batteryLevel != -1) {
          result.success(batteryLevel);
        } else {
          result.error("UNAVAILABLE", "Battery level not available.", null);
        }
      } else if(methodCall.method.equals("throwError")) {
        throw new RuntimeException("Will Sentry catch this?");
      } else {
        result.notImplemented();
      }
    });
  }

  private int getBatteryLevel() {
    int batteryLevel = -1;
    if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
      BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
      batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
    } else {
      Intent intent = new ContextWrapper(getApplicationContext()).registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
      batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)*100) / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
    }
    return  batteryLevel;
  }
}
