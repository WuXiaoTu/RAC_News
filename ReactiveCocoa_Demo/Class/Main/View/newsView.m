//
//  newsView.m
//  ReactiveCocoa_Demo
//
//  Created by Transuner on 2017/2/4.
//  Copyright © 2017年 吴冰. All rights reserved.
//

#import "newsView.h"

@implementation newsView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _cycleScrollView = [[SDCycleScrollView alloc]initWithFrame:CGRectMake(0, 0, S_SCREEN_WIDTH, 180)];
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _cycleScrollView.currentPageDotColor = [UIColor redColor]; // 自定义分页控件小圆标颜色
        _cycleScrollView.autoScrollTimeInterval = 2;//滚动时间
        _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
        _cycleScrollView.clipsToBounds = YES;
        _cycleScrollView.placeholderImage = [UIImage imageNamed:@"WBBAN"];
        [self addSubview:_cycleScrollView];
    }
    return self;
}

@end
