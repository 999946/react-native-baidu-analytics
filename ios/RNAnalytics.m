
#import "RNAnalytics.h"
#import "BaiduMobStat.h"

@implementation RNAnalytics


- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()


RCT_EXPORT_METHOD(start:(NSDictionary *)options) {
    
    BaiduMobStat* statTracker = [BaiduMobStat defaultStat];
    statTracker.shortAppVersion  = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    statTracker.channelId = [options objectForKey:@"appChannel"];
    statTracker.enableDebugOn = [[options objectForKey:@"isDebug"]boolValue];
    statTracker.enableExceptionLog = [[options objectForKey:@"enableExceptionLog"] boolValue];
    statTracker.logSendWifiOnly = [[options objectForKey:@"onlyWifi"]boolValue];
    
    statTracker.sessionResumeInterval = [[options objectForKey:@"sessionTimeOut"] integerValue];
    

    
    BaiduMobStatLogStrategy* logStrategy;
    NSString* type = [options objectForKey:@"sendStrategy"];
    if(type == @"APP_START"){
        logStrategy = BaiduMobStatLogStrategyAppLaunch;
    }else if(type == @"ONCE_A_DAY"){
        logStrategy = BaiduMobStatLogStrategyDay;
    }else if(type == @"SET_TIME_INTERVAL"){
        logStrategy = BaiduMobStatLogStrategyCustom;
        statTracker.logSendInterval = [[options objectForKey:@"logSendInterval"] integerValue];
    }
    statTracker.logStrategy = logStrategy;
    [statTracker startWithAppId:[options objectForKey:@"appKey"]];
}


RCT_EXPORT_METHOD(onPageStart:(NSString *)name) {
    [[BaiduMobStat defaultStat] pageviewStartWithName:name];
}

RCT_EXPORT_METHOD(onPageEnd:(NSString *)name) {
    [[BaiduMobStat defaultStat] pageviewEndWithName:name];
}

RCT_EXPORT_METHOD(setDebugOn:(bool *)isDebug) {
    [BaiduMobStat defaultStat].enableDebugOn = isDebug;
}

RCT_EXPORT_METHOD(onEvent:(NSString *)eventId eventLabel:(NSString *)eventLabel) {
     [[BaiduMobStat defaultStat] logEvent:eventId eventLabel:eventLabel];
}

RCT_EXPORT_METHOD(onEventStart:(NSString *)eventId eventLabel:(NSString *)eventLabel) {
    [[BaiduMobStat defaultStat] eventStart:eventLabel eventLabel:eventLabel];
}

RCT_EXPORT_METHOD(onEventEnd:(NSString *)eventId eventLabel:(NSString *)eventLabel) {
    [[BaiduMobStat defaultStat] eventEnd:eventLabel eventLabel:eventLabel];
}

RCT_EXPORT_METHOD(onEventDuration:(NSString *)eventId eventLabel:(NSString *)eventLabel durationTime:(unsigned long)duration) {
    [[BaiduMobStat defaultStat] logEventWithDurationTime:eventLabel eventLabel:eventLabel durationTime:duration];
}

@end
  
