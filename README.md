
# react-native-baidu-analytics

## Getting started

`$ npm install react-native-baidu-analytics --save`

### Mostly automatic installation

`$ react-native link react-native-baidu-analytics`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-baidu-analytics` and add `RNAnalytics.xcodeproj`
3. In XCode, in the project navigator, select your project. 
Add `libRNAnalytics.a、
    JavaScriptCore.framework、
    Security.framework、
    CoreLocation.framework、
    SystemConfiguration.framework、
    CoreTelephony.framework、
    CoreGraphics.framework、
    UIKit.framework、
    Foundation.framework、
    libz.1.2.5.tbd、
    libstdc++.tbd` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNAnalyticsPackage;` to the imports at the top of the file
  - Add `new RNAnalyticsPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-baidu-analytics'
  	project(':react-native-baidu-analytics').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-baidu-analytics/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-baidu-analytics')
  	```

## SDK版本
iOS ： 基础分析v4.5.0  Crash分析v4.5.0
Android： com.baidu.mobstat:mtj-sdk:latest.integration

## API

* start(options)
```
// options对象属性
{
  appKey: '',
  appChannel: '',
  // 是否是调试模式
  isDebug: true,
  // 是否启用Crash日志收集 默认值
  enableExceptionLog: true,
  // 设置启动时日志发送延时的秒数 单位为秒，大小为0s到30s之间 
  // 如果设置的是发送策略是APP_START(启动时发送)，那么这个参数就会在发送前检查您设置的这个参数，表示延迟多少S发送。
  // 此参数只在安卓中使用
  logSenderDelayed: 5,
  // 日志仅在wifi网络下发送，默认为false
  onlyWifi: true,
  // 设置Session超时的秒数 单位为秒，大小为1到600之间，默认为30 解释：“Session超时”指的是 应用停留在后台期间，用户无操作的时长
  sessionTimeOut: 30,
  // 日志发送策略，可选值：APP_START、ONCE_A_DAY、SET_TIME_INTERVAL，默认为APP_START
  sendStrategy: 'APP_START',
  // 发送策略为SendStrategyEnum.SET_TIME_INTERVAL 时，此值有效。为1-24之间的整数
  rtimeInterval: 1
}
```
* onPageStart(String name)
* onPageEnd(String name)
* setDebugOn(Boolean isDebug)
* onEvent(String eventId, String label)
* onEvent(String eventId, String label)
* onEventEnd(String eventId, String label)
* onEventDuration(String eventId, String label, long milliseconds)


## Usage

```javascript
import RNAnalytics from 'react-native-baidu-analytics';

RNAnalytics.start({
  appKey: '11111111',
  appChannel: 'APP STORE',
  isDebug: true,
  enableExceptionLog: true,
  logSenderDelayed: 5,
  onlyWifi: false,
  sessionTimeOut: 30,
  sendStrategy: 'APP_START',
  rtimeInterval: 1
});
```


  