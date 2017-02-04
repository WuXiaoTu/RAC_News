//
//  newsModel.h
//  ReactiveCocoa_Demo
//
//  Created by Transuner on 2017/2/4.
//  Copyright © 2017年 吴冰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface newsModel : NSObject
@property (nonatomic, copy) NSString * content;
@property (nonatomic, copy) NSString * crtime;
@property (nonatomic, copy) NSString * nid;
@property (nonatomic, copy) NSString * readnum;
@property (nonatomic, copy) NSString * reviewnum;
@property (nonatomic, copy) NSString * sallimg;
@property (nonatomic, copy) NSString * title;

@end
