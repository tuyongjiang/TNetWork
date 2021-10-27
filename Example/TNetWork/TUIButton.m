//
//  TUIButton.m
//  TNetWork_Example
//
//  Created by 涂永江 on 2021/7/7.
//  Copyright © 2021 tuyongjiang. All rights reserved.
//

#import "TUIButton.h"

@implementation TUIButton

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"按钮点击了");
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"按钮点击结束了");
}
@end
