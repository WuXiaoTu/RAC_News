//
//  newsViewModel.h
//  ReactiveCocoa_Demo
//
//  Created by Transuner on 2017/2/4.
//  Copyright © 2017年 吴冰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface newsViewModel : NSObject

@property (nonatomic ,strong)   NSMutableArray * newsList;
@property (nonatomic ,strong)   NSMutableArray * advertis;
@property (nonatomic ,strong)   RACSubject     * cellClickSubJect;
@property (nonatomic ,readonly) RACSignal      * updateNewsSignal;
@property (nonatomic ,readonly) RACSignal      * updateMoreSignal;
@property (nonatomic ,readonly) RACSignal      * updateAdvertisingSignal;

@end
