//
//  TStudent.m
//  TNetWork_Example
//
//  Created by 涂永江 on 2021/7/2.
//  Copyright © 2021 tuyongjiang. All rights reserved.
//

#import "TStudent.h"


@interface TStudent ()
@property (nonatomic , strong) NSObject *obj;
@end

@implementation TStudent
- (void)eat{
    [super eat];
    NSLog(@"TStudent - eat");
    NSLog(@"TStudent %@",self.obj);
}
+ (void)initialize
{
    NSLog(@"TStudent - initialize");
}

-(NSObject *)obj{
    if(!_obj){
        _obj = [NSObject new];
    }
    return _obj;
}

@end
