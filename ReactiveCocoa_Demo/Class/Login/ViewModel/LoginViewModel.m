//
//  LoginViewModel.m
//  ReactiveCocoa_Demo
//
//  Created by Transuner on 2017/2/4.
//  Copyright © 2017年 吴冰. All rights reserved.
//

#import "LoginViewModel.h"
#import "BaseHttpRequest.h"

@implementation LoginViewModel

- (RACSignal *)signInSignal {
    return [RACSignal createSignal:^RACDisposable * (id subscriber) {
        [self signInWithUsername:self.userName password:self.password complete:^(id responsObject) {
            [subscriber sendNext:responsObject];
            [subscriber sendCompleted];
        }];
        return nil;
    }];
}

-(instancetype)init
{
    if (self = [super init]) {

        RACSignal *userNameLengthSig = [RACObserve(self, userName)
                                        map:^id(NSString *value) {
                                            if (value.length >= 11)
                                                return @(YES);
                                            return @(NO);
                                        }];
        RACSignal *passwordLengthSig = [RACObserve(self, password)
                                        map:^id(NSString *value) {
                                            if (value.length >= 6) return @(YES);
                                            return @(NO);
                                        }];
        

        _loginBtnEnable = [RACSignal combineLatest:@[userNameLengthSig, passwordLengthSig] reduce:^id(NSNumber *userName, NSNumber *password){
            return @([userName boolValue] && [password boolValue]);
        }];

        
        _loginCommand = [[RACCommand alloc]initWithEnabled:_loginBtnEnable signalBlock:^RACSignal *(id input) {
            return [self signInSignal];
        }];
    }
    return self;
}
- (void)signInWithUsername:(NSString *)username password:(NSString *)password complete:(void(^)(id responsObject))completeBlock {
    NSMutableDictionary * parameter = [NSMutableDictionary dictionary];
    parameter[@"phone"] = username;
    parameter[@"password"] = password;
    parameter[@"Ctoken"] = @"asdflajsdfljalnlksadflkjdsalkfjkljwl";
    parameter[@"acid"] = @"37";
    [BaseHttpRequest post:APILOGIN parameter:parameter HttpProgress:^(NSProgress *progress) {
        
    } success:^(id responseObject, BOOL error) {
        if (error) {
            completeBlock(responseObject);
            //登录成功返回的数据就在这里做处理保存到本地！你懂的。
        }

    } failure:^(NSError *error) {
        
    }];
}


@end
