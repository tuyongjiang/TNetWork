//
//  TTimer.m
//  TNetWork_Example
//
//  Created by 涂永江 on 2021/8/4.
//  Copyright © 2021 tuyongjiang. All rights reserved.
//

#import "TTimer.h"

@implementation TTimer
+ (NSString *)startTimer:(void(^)(void))stask startTime:(NSInteger)startTime loopTime:(NSInteger)loopTime repeats:(BOOL)repeats async:(BOOL)async{
    //创建一个定时器
    dispatch_queue_t queue = async ? dispatch_get_global_queue(0, 0) : dispatch_get_main_queue();
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, startTime * NSEC_PER_SEC), loopTime * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        stask();
    });
    
    return @"1";
}
@end
