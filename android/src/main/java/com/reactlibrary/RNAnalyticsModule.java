
package com.reactlibrary;

import com.baidu.mobstat.SendStrategyEnum;
import com.baidu.mobstat.StatService;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReadableMap;

public class RNAnalyticsModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNAnalyticsModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNAnalytics";
  }


  @ReactMethod
  public void start(ReadableMap options) {
    if(options == null){
      StatService.start(this.reactContext);
    } else {
      StatService.setAppKey(options.getString("appKey"));
      StatService.setAppChannel(this.reactContext, options.getString("appChannel"), true);
      StatService.setDebugOn(options.getBoolean("isDebug"));

      if(options.getBoolean("enableExceptionLog")){
        StatService.setOn(this.reactContext, StatService.EXCEPTION_LOG);
      }

      StatService.setSessionTimeOut(options.getInt("sessionTimeOut"));
      StatService.setLogSenderDelayed(options.getInt("logSenderDelayed"));

      SendStrategyEnum sendStrategy = SendStrategyEnum.valueOf(options.getString("sendStrategy"));

      if(sendStrategy != null) {
        boolean onlyWifi = options.getBoolean("onlyWifi");
        int logSendInterval = options.getInt("logSendInterval");
        StatService.setSendLogStrategy(this.reactContext, sendStrategy, logSendInterval, onlyWifi);
      }
    }
  }

  @ReactMethod
  public void onPageStart(String name) {
    StatService.onPageStart(this.reactContext, name);
  }

  @ReactMethod
  public void onPageEnd(String name) {
    StatService.onPageEnd(this.reactContext, name);
  }

  @ReactMethod
  public void setDebugOn(Boolean isDebug) {
    StatService.setDebugOn(isDebug);
  }

  @ReactMethod
  public void onEvent(String eventId, String label) {
    StatService.onEvent(this.reactContext, eventId, label);
  }

  @ReactMethod
  public void onEventStart(String eventId, String label) {
    StatService.onEventStart(this.reactContext, eventId, label);
  }

  @ReactMethod
  public void onEventEnd(String eventId, String label) {
    StatService.onEventEnd(this.reactContext, eventId, label);
  }

  @ReactMethod
  public void onEventDuration(String eventId, String label, Integer milliseconds) {
    StatService.onEventDuration(this.reactContext, eventId, label, milliseconds.longValue());
  }


}