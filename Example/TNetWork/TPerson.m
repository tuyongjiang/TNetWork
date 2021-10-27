//
//  TPerson.m
//  TNetWork_Example
//
//  Created by 涂永江 on 2021/7/2.
//  Copyright © 2021 tuyongjiang. All rights reserved.
//

#import "TPerson.h"

@interface TPerson ()
@property (strong , nonatomic) NSObject *obj;
@end

@implementation TPerson
- (void)eat{
    NSLog(@"TPerson - eat");
    NSLog(@"哈哈");
    NSLog(@"TPerson %@",self.obj);
}
+ (void)initialize
{
    NSLog(@"TPerson - initialize");
}
-(NSObject *)obj{
    if(!_obj){
        _obj = [NSObject new];
    }
    return _obj;
}
+(instancetype)person{
    TPerson *p = [TPerson new];
    return p;
}
@end
