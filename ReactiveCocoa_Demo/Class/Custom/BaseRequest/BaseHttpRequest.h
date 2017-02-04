//
//  BaseHttpRequest.h
//  ReactiveCocoa_Demo
//
//  Created by Transuner on 2017/2/4.
//  Copyright © 2017年 吴冰. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSURLSessionTask BaseSessionTask;
@interface BaseHttpRequest : NSObject


+ (instancetype) shareManager;

+ (BaseSessionTask *) post:(NSString*)url
    parameter:(NSDictionary*)parames
 HttpProgress:(void(^)(NSProgress * progress))progress
      success:(void(^)(id responseObject,BOOL error))success
      failure:(void(^)(NSError * error))failure;
@end
