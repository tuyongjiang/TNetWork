//
//  TTimer.h
//  TNetWork_Example
//
//  Created by 涂永江 on 2021/8/4.
//  Copyright © 2021 tuyongjiang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TTimer : NSObject
+ (NSString *)startTimer:(void(^)(void))stask startTime:(NSInteger)startTime loopTime:(NSInteger)loopTime repeats:(BOOL)repeats;
@end

NS_ASSUME_NONNULL_END
