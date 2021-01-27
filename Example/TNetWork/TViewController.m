//
//  TViewController.m
//  TNetWork
//
//  Created by tuyongjiang on 01/27/2021.
//  Copyright (c) 2021 tuyongjiang. All rights reserved.
//

#import "TViewController.h"
#import "TDefaultAPI.h"
@interface TViewController ()

@end

@implementation TViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    TDefaultAPI *api = [TDefaultAPI new];
    [api startRequest:^(TResponse *response) {
        NSLog(@"%@",response.responseObject);
    } failure:^(TResponse *response) {
        NSLog(@"%@",response);
    }];
    NSLog(@"1111");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
