//
//  newsModel.m
//  ReactiveCocoa_Demo
//
//  Created by Transuner on 2017/2/4.
//  Copyright © 2017年 吴冰. All rights reserved.
//

#import "newsModel.h"

@implementation newsModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"nid":@"id"};
}
@end
