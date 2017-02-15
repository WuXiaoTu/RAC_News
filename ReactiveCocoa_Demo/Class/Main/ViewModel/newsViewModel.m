//
//  newsViewModel.m
//  ReactiveCocoa_Demo
//
//  Created by Transuner on 2017/2/4.
//  Copyright © 2017年 吴冰. All rights reserved.
//

#import "newsViewModel.h"
#import "BaseHttpRequest.h"
#import "newsModel.h"

@interface newsViewModel ()
@property (nonatomic, assign) NSInteger newPageNum;
@end

@implementation newsViewModel

- (instancetype) init {
    
    if (self = [super init]) {
        
        
    }
    return self;
}

- (void)requestNewSubscribeWithPage:(NSInteger)page completion:(void(^)())completion
{
    NSMutableDictionary * parames = [NSMutableDictionary dictionary];
    parames[@"start"] = @(_newPageNum);
    parames[@"size"]  = @(10);
    [BaseHttpRequest post:APIURL parameter:parames HttpProgress:^(NSProgress *progress) {
    } success:^(id responseObject, BOOL error) {
        if (error) {
            if (self.newPageNum == 0) {
                self.newsList = [newsModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
            } else {
                [self.newsList addObjectsFromArray:[newsModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]]];
            }
            completion();
        }
    } failure:^(NSError *error) {
        NSLog(@"error :%@",error.localizedDescription);
    }];
}

- (void)requestAdvertisingSubscribeCompletion:(void(^)(id responseObject))completion
{
    [BaseHttpRequest post:APICURREVENTS parameter:nil HttpProgress:^(NSProgress *progress) {
    } success:^(id responseObject, BOOL error) {
        if (error) {
            
            NSArray * adverArray = responseObject[@"data"];
            RACSequence *sequence = [[adverArray valueForKey:@"url"] rac_sequence];
            RACSignal *signal =  sequence.signal;
            [signal subscribeNext:^(NSString * x) {
                [self.advertis addObject:x];
                if (adverArray.count == self.advertis.count) completion(self.advertis);
            }];

        }
    } failure:^(NSError *error) {
    }];
}

@synthesize updateNewsSignal = _updateNewsSignal;
- (RACSignal *)updateNewsSignal
{
    if (!_updateNewsSignal) {
        @synchronized (self) {
            if (!_updateNewsSignal) {
                @weakify(self)
                _updateNewsSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                    @strongify(self);
                    [self requestNewSubscribeWithPage:self.newPageNum completion:^{
                        [subscriber sendNext:nil];
                    }];
                    return nil;
                }];
                self.newPageNum = 0;
            }
        }
    }
    return _updateNewsSignal;
}

@synthesize updateMoreSignal = _updateMoreSignal;
- (RACSignal *)updateMoreSignal
{
    if (!_updateMoreSignal) {
        @synchronized (self) {
            if (!_updateMoreSignal) {
                @weakify(self)
                _updateMoreSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                    @strongify(self);
                    [self requestNewSubscribeWithPage:self.newPageNum completion:^{
                        [subscriber sendNext:nil];
                    }];
                    return nil;
                }];
                self.newPageNum += 10;
            }
        }
    }
    return _updateMoreSignal;
}
@synthesize updateAdvertisingSignal = _updateAdvertisingSignal;
- (RACSignal *)updateAdvertisingSignal
{
    if (!_updateAdvertisingSignal) {
        @synchronized (self) {
            if (!_updateAdvertisingSignal) {
                @weakify(self)
                _updateAdvertisingSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                    @strongify(self);
                    [self requestAdvertisingSubscribeCompletion:^(id responseObject) {
                        [subscriber sendNext:responseObject];
                    }];
                    return nil;
                }];
            }
        }
    }
    return _updateAdvertisingSignal;
}
@synthesize cellClickSubJect = _cellClickSubJect;
- (RACSubject *)cellClickSubJect {
    if (!_cellClickSubJect) {
        @synchronized (self) {
            if (!_cellClickSubJect) {
                _cellClickSubJect = [RACSubject subject];
            }
        }
    }
    return _cellClickSubJect;
}


- (NSMutableArray *)newsList
{
    if (!_newsList) {
        _newsList = [[NSMutableArray alloc] init];
    }
    return _newsList;
}

- (NSMutableArray *)advertis
{
    if (!_advertis) {
        _advertis = [[NSMutableArray alloc] init];
    }
    return _advertis;
}


@end
