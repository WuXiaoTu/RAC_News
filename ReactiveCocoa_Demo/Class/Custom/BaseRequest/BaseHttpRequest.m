//
//  BaseHttpRequest.m
//  ReactiveCocoa_Demo
//
//  Created by Transuner on 2017/2/4.
//  Copyright © 2017年 吴冰. All rights reserved.
//

#import "BaseHttpRequest.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "WSProgressHUD.h"
static BaseHttpRequest *baseSessionManager= nil;
@implementation BaseHttpRequest

+(instancetype)shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        baseSessionManager = [[BaseHttpRequest alloc]init];
    });
    return baseSessionManager;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        baseSessionManager = [super allocWithZone:zone];
    });
    return baseSessionManager;
}

+ (AFHTTPSessionManager *)createAFHTTPSessionManager
{
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.requestSerializer.timeoutInterval = 30.f;

        manager.responseSerializer = [AFJSONResponseSerializer serializer];

        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;

        manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

        AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
        response.removesKeysWithNullValues = YES;
        manager.responseSerializer = response;

        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/xml",@"text/plain", @"application/javascript", @"image/*", nil];
    });
    return manager;
}

+ (BaseSessionTask *)post:(NSString *)url parameter:(NSDictionary *)parames HttpProgress:(void (^)(NSProgress *))progress success:(void (^)(id, BOOL))success failure:(void (^)(NSError *))failure {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [WSProgressHUD showWithMaskType:WSProgressHUDMaskTypeBlack];

    AFHTTPSessionManager *manager = [self createAFHTTPSessionManager];
    return [manager POST:url parameters:parames progress:^(NSProgress * _Nonnull uploadProgress)
    {
        progress ? progress(uploadProgress) : nil;

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject[@"result"][@"code"]isEqualToString:@"200"]) {
            success?success(responseObject,YES):nil;
        } else {
            success?success(responseObject,NO):nil;
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [WSProgressHUD dismiss];


    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure ? failure(error) : nil;
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [WSProgressHUD dismiss];

    }];
}

@end
