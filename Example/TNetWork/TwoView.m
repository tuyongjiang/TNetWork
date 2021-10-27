//
//  TwoView.m
//  TNetWork_Example
//
//  Created by 涂永江 on 2021/7/7.
//  Copyright © 2021 tuyongjiang. All rights reserved.
//

#import "TwoView.h"

@implementation TwoView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"twoView开始");
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"twoView结束");
}

@end
