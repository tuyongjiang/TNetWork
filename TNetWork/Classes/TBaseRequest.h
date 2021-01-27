//
//  TBaseRequest.h
//  TNetWork
//
//  Created by 涂永江 on 2021/1/21.
//  Copyright © 2021 涂永江. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "TNetworkDefine.h"
NS_ASSUME_NONNULL_BEGIN

@interface TBaseRequest : NSObject


#pragma - 发起网络请求
- (void)startRequest;
- (void)startRequest:(TSuccessBlock)success failure:(TFailureBlock)failure;

#pragma - 代理
@property (nonatomic , weak) id<TResponseDelegate> delegate;

#pragma - 设置请求信息
//请求类型
@property (nonatomic , assign)  TNetWorkRequestType requestType;
//请求url
@property (nonatomic , copy)    NSString   *requestUrl;
//请求参数
@property (nonatomic , copy, nonnull) NSDictionary *requestParameter;
//请求头信息
@property (nonatomic ,copy, nonnull) NSDictionary *HTTPHeaderField;
//请求超时时间
@property (nonatomic, assign) NSTimeInterval requestTimeoutInterval;
//基础的url
@property (nonatomic , copy)   NSString *baseUrl;
//对象是否策略
@property (nonatomic , assign) TNetworkReleaseStrategy releaseStrategy;
//网络请求策略
@property (nonatomic , assign) TNetworkRepeatStrategy  repeatStrategy;

#pragma - AF请求和响应解析配置
@property (nonatomic , strong) AFHTTPRequestSerializer *requestSerializer;
@property (nonatomic , strong) AFHTTPResponseSerializer *responseSerializer;

@end

NS_ASSUME_NONNULL_END
