//
//  LoginViewModel.h
//  ReactiveCocoa_Demo
//
//  Created by Transuner on 2017/2/4.
//  Copyright © 2017年 吴冰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginViewModel : NSObject
@property(nonatomic, copy) NSString *userName;
@property(nonatomic, copy) NSString *password;
@property(nonatomic, strong, readonly) RACCommand *loginCommand;
@property(nonatomic, strong, readonly) RACSignal *loginBtnEnable;

@end
