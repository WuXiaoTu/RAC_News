//
//  newsNavigationController.m
//  ReactiveCocoa_Demo
//
//  Created by Transuner on 2017/2/4.
//  Copyright © 2017年 吴冰. All rights reserved.
//

#import "newsNavigationController.h"
#import "newsNavigationBar.h"

@interface newsNavigationController ()

@end

@implementation newsNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.translucent = NO;
    self.navigationBar.tintColor   = R_UIColorFromRGB(0xffffff);
    
    self.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                              [UIColor whiteColor],
                                              NSForegroundColorAttributeName,
                                              [UIFont fontWithName:@"MicrosoftYaHei" size:18],
                                              NSFontAttributeName, nil];
    newsNavigationBar * _navigationBar = (newsNavigationBar*)self.navigationBar;
    [_navigationBar setBackgroundImage:[self imageWithColor:R_UIColorFromRGB(0xd9161f) height:64] forBarMetrics:UIBarMetricsDefault];
    _navigationBar.shadowImage = [UIImage new];
}

- (UIImage *)imageWithColor:(UIColor *)color height:(CGFloat)height{
    CGRect rect = CGRectMake(0, 0, S_SCREEN_WIDTH, height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


@end
