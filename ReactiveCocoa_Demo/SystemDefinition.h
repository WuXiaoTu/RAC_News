//
//  SystemDefinition_h 
//  系统级别常用的预处理文件
//  vesion:1.0
//  Created by Motinle on 12-3-12.
//  Copyright (c) 2013年 广州传讯信息科技有限公司. All rights reserved.
//

#ifndef SystemDefinition_h
#define SystemDefinition_h
#import "AppDelegate.h"


#define appDelegate ((AppDelegate *)([[UIApplication sharedApplication]delegate]))
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define newsTitle @"新闻"
//-------------------获取设备与系统信息开始-------------------------
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
//获取屏幕 宽度、高度
#define S_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define S_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define AUTOX [[UIScreen mainScreen] bounds].size.width/320
#define AUTOY (([[UIScreen mainScreen] bounds].size.height/568)>(1)?([[UIScreen mainScreen] bounds].size.height/568):(1))

//获取系统版本(如:6.100000)
#define S_IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//获取系统版本(如:6.1)
#define S_CurrentSystemVersion [[UIDevice currentDevice] systemVersion]

//获取当前语言 如：en
#define S_CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//判断是否 Retina屏、设备是否%fhone 5、是否是iPad
#define S_isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define S_isPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define S_isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


//判断是真机还是模拟器
#if TARGET_OS_IPHONE
//iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif

#define S_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)

//检查对比系统版本
#define S_SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)

#define S_SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)

#define S_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define S_SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

#define S_SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

//-------------------获取设备与系统信息结束-------------------------






//----------------------内存相关管理开始----------------------------

//使用ARC和不使用ARC
#if __has_feature(objc_arc)
//compiling with ARC
#else
// compiling without ARC
#endif

#pragma mark - common functions
#define S_RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }

//释放一个对象
#define S_SAFE_DELETE(P) if(P) { [P release], P = nil; }

#define S_SAFE_RELEASE(x) [x release];x=nil

//----------------------内存相关管理结束----------------------------








//-------------------数据持久化相关开始-------------------------

//Documents
#define S_DIR_Doucument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

//Library/Caches
#define S_DIR_Cache  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

//tmp
#define S_DIR_Temp  NSTemporaryDirectory()

//NSUserDefaults 实例化
#define S_USER_DEFAULT [NSUserDefaults standardUserDefaults]
//-------------------数据持久化目录结束-------------------------



//G－C－D
#define S_GCD_BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define S_GCD_MAIN(block) dispatch_async(dispatch_get_main_queue(),block)






//单例化一个类
#define S_SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [[self alloc] init]; \
} \
} \
\
return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [super allocWithZone:zone]; \
return shared##classname; \
} \
} \
\
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
}



#endif
