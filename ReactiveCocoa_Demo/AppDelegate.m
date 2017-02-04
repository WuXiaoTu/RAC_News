//
//  AppDelegate.m
//  ReactiveCocoa_Demo
//
//  Created by Transuner on 2017/1/26.
//  Copyright © 2017年 吴冰. All rights reserved.
//

#import "AppDelegate.h"
#import "newsController.h"
#import "newsNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    newsController * newsC = [[newsController alloc]init];
    newsC.title = newsTitle;
    newsNavigationController * newsN = [[newsNavigationController alloc]initWithRootViewController:newsC];
    [self.window setRootViewController:newsN];
    [self.window makeKeyAndVisible];
    return YES;
}
@end
