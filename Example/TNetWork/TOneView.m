//
//  TOneView.m
//  TNetWork_Example
//
//  Created by 涂永江 on 2021/7/7.
//  Copyright © 2021 tuyongjiang. All rights reserved.
//

#import "TOneView.h"

@implementation TOneView
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"oneView开始");
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"oneView结束");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
