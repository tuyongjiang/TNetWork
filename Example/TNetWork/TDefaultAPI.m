//
//  TDefaultAPI.m
//  TNetWork_Example
//
//  Created by 涂永江 on 2021/1/27.
//  Copyright © 2021 tuyongjiang. All rights reserved.
//

#import "TDefaultAPI.h"

@implementation TDefaultAPI
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.baseUrl = @"https://api.ecook.cn/public/";
    }
    return self;
}

-(NSString *)requestUrl{
    return @"getHomeData.shtml";
}
- (TNetWorkRequestType)requestType{
    return TNetWorkRequestTypeGET;
}

-(NSDictionary *)requestParameter{
    return @{@"app":@"eCook",@"appid":@"cn.ecook.ecook",@"device":@"iPhone%206s",@"machine":@"O7a67bcc4f3121ddff51a25c1809f74194f5e7baf",@"terminal":@"3",@"version":@"13.9.3"};
}
-(void)dealloc{
    
}
@end
