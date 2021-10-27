//
//  TViewController.m
//  TNetWork
//
//  Created by tuyongjiang on 01/27/2021.
//  Copyright (c) 2021 tuyongjiang. All rights reserved.
//

#import "TViewController.h"
#import "TDefaultAPI.h"
#import "WWBHomePageFlowLayout.h"
#import "TStudent.h"
#import "TUIButton.h"
#import "TOneView.h"
#import "TwoView.h"
#import "TPerson.h"
@interface TViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) UICollectionView *collectionView;
@property (nonatomic , strong) NSTimer *timer;
@end

__weak id res = nil;
@implementation TViewController

- (void)clik:(UIButton *)btn{
    NSLog(@"走了");
}
- (void)tap:(UITapGestureRecognizer*)tap{
    NSLog(@"tap走了");
}
- (void)testTimer{
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    NSLog(@"%s",__func__);
//    NSLog(@"%@",pers);
//        _objc_autoreleasePoolPrint();
//    _objc_autoreleasePoolPrint();
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    NSLog(@"%s",__func__);
//    NSLog(@"%@",pers);

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (int i = 0; i < 3; ++i) {
         
        @autoreleasepool {
            TPerson *per = [TPerson person];
            
        }
        _objc_autoreleasePoolPrint();
     }
}
extern void _objc_autoreleasePoolPrint(void);




- (void)viewDidLoad
{
    [super viewDidLoad];
    __weak TPerson *pers;
    __weak NSArray * weakArray;
    
//    TPerson *per1 = [TPerson person];
////    __weak id pers = nil;

    
//    NSLog()
    
    NSLog(@"%@",pers);
    NSLog(@"%@",weakArray);
//    
//
//    for(int i = 0 ;i < 1; i++){
//            @autoreleasepool {
//
//
//                _objc_autoreleasePoolPrint();
//            }
//
//    }

//    _objc_autoreleasePoolPrint();
     // 打印注册到autoreleasePool中的对象
    
    //scheduledTimerWithTimeInterval会自动加入当前的runloop不需要我们手动开启就可以启动定时器
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(testTimer) userInfo:nil repeats:YES];
//    //默认不会加入runloop中,需要我们手动添加
//    NSTimer *timer1 = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(testTimer) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer1 forMode:NSDefaultRunLoopMode];
    /*
     以上这个种方法会导致控制器无法释放,因为NSTimer的target强引用这我们的控制器,而控制器有强引用我们的timer,所以无法释放.
     解决方案
     1.如果我们使用弱引用传给target那么是不是就可以了
     __weak typeof(self) this = self;
     错 ,因为我们的target是一个强引用,我们传入的是控制器的地址,一样引用着,还是不会释放
     那么我们如何解决?
     可以使用定时器的另一个带block的方法,我们用弱引用在block里面,我们知道block引用外部变量的时候会看是强引用还是弱引用,如果是弱引用的话,内部就会用弱引用的,从而不会发生内存泄漏
     NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
         [this testTimer];
     }];
     
    */

//
//    TStudent *student = [[TStudent alloc] init];
//    [student eat];
//
//    TOneView *onewView = [[TOneView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    onewView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:onewView];
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
////        tap.numberOfTapsRequired = 2;
//        [onewView addGestureRecognizer:tap];
//    TwoView *two = [[TwoView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
//    two.backgroundColor = [UIColor greenColor];
//    [onewView addSubview:two];
//    NSLog(@"执行任务1");
//    dispatch_queue_t queue = dispatch_queue_create("111", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(queue, ^{
//        NSLog(@"执行任务2");
//        dispatch_sync(queue, ^{
//            NSLog(@"执行任务3");
//        });
//        NSLog(@"执行任务4");
//    });
//    NSLog(@"执行任务5");
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        self.timer = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//            NSLog(@"11111");
//        }];
//        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
//        [[NSRunLoop currentRunLoop] run];
//    });
//

//
 
//    NSArray *arr1 = @[@"4",@"3",@"1"];
//    NSArray *arr2 = @[@"2",@"5",@"6"];
//
//    NSMutableArray *arr = [NSMutableArray arrayWithArray:arr1];
//    [arr addObjectsFromArray:arr2];
//
//    for (int i = 0; i < arr.count; i++) {
//        for (int j = i+1; j<arr.count; j++) {
//            if([arr[i] intValue]<[arr[j] intValue]){
//                NSString  *tem = arr[j];
//                arr[j] = arr[i];
//                arr[i] = tem;
//            }
//        }
//        for (int z = 0; z < arr.count; z++) {
//            NSLog(@"第%ld次 %@",i,arr[z]);
//        }
//    }
//
   
////    1 2 3 4 5 6
//    int index = arr.count / 2;
//    if(!(arr.count%2)){
//        float mid = ([arr[index-1] intValue] + [arr[index] intValue])/2.0;
//
//        NSLog(@"%d --  %d   %f",[arr[index-1] intValue],[arr[index] intValue],mid);
//    }else{
//        int mid = ([arr[index-1] intValue]);
//        NSLog(@"%d",mid);
//    }
    
//    TDefaultAPI *api = [TDefaultAPI new];
//    [api startRequest:^(TResponse *response) {
//        NSLog(@"%@",response.responseObject);
//    } failure:^(TResponse *response) {
//        NSLog(@"%@",response);
//    }];

//    NSLog(@"1111");
    
//    NSString *str = @"abcaeac";
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    int start = 0;
//    int result = 0;
//    for (int i = 0; i < str.length; i++) {
//        NSString *cha = [str substringWithRange:NSMakeRange(i,1)];
//        if ([dict.allKeys containsObject:cha]) {
//            NSInteger index = [[dict objectForKey:cha] integerValue];
//            start = MAX(index, start);
//        }
//        result = MAX(result,i - start + 1);
//        NSLog(@"start    %d",start);
//        NSLog(@"result   %d",result);
//        [dict setObject:@(i+1) forKey:cha];
//    }

//    WWBHomePageFlowLayout *layout = [[WWBHomePageFlowLayout alloc] init];
//    layout = [[WWBHomePageFlowLayout alloc]init];
//    layout.delegate = self;
//    layout.columnCount = 2;
//    layout.columnMargin = 10;
//    layout.rowMargin = 10;

//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
//    self.collectionView = collectionView;
//    [self.view addSubview:collectionView];
////    collectionView.pagingEnabled = YES;
//    collectionView.delegate = self;
//    collectionView.dataSource = self;
//    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
//    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
}

//Cell高度
-(CGFloat)HPFlowLayout:(WWBHomePageFlowLayout *) HPFlowLayout
        heightForWidth:(CGFloat)width
          andIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0){
        return 100;
    }else{
        return 80;
    }
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 50;
}

-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor redColor];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    [cell.contentView addSubview:label];
//    label.text = [NSString stringWithFormat:@"我是第%ld个",indexPath.row];
//
    return  cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
         UICollectionReusableView *headerView = [self.collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerId" forIndexPath:indexPath];
        if(headerView == nil)
        {
            headerView = [[UICollectionReusableView alloc] init];
          
        }
        headerView.backgroundColor = [UIColor greenColor];
         return headerView;
    }
    
    return [UICollectionReusableView new];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.view.frame.size.width, 30);
}
- (CGSize)HPFlowLayout:(__weak WWBHomePageFlowLayout *_Nullable)HPFlowLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.view.frame.size.width, 30);
}
- (void)testTableViewInsede{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    view.backgroundColor = [UIColor redColor];
    tableView.tableHeaderView = view;
    [self.view addSubview:tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"我是第%ld个",indexPath.row];
    return cell;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(scrollView.contentOffset.y >100){
        self.tableView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
    }else{
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
