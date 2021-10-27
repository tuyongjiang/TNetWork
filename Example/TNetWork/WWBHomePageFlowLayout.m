//
//  WWBHomePageFlowLayout.m
//  Business
//
//  Created by 林海生 on 2018/5/25.
//  Copyright © 2018年 prince. All rights reserved.
//

#import "WWBHomePageFlowLayout.h"

//每一列item之间的间距
//static const CGFloat columnMargin = 10;
//每一行item之间的间距
//static const CGFloat rowMargin = 10;

@interface WWBHomePageFlowLayout()
/** 这个字典用来存储每一列item的高度 */
@property (strong,nonatomic)NSMutableDictionary *maxYDic;
/** 存放每一个item的布局属性 */
@property (strong,nonatomic)NSMutableArray *attrsArray;
@end

@implementation WWBHomePageFlowLayout

/** 懒加载 */
-(NSMutableDictionary *)maxYDic
{
    if (!_maxYDic)
    {
        _maxYDic = [NSMutableDictionary dictionary];
    }
    return _maxYDic;
}

/** 懒加载 */
-(NSMutableArray *)attrsArray
{
    if (!_attrsArray)
    {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}

-(void)dealloc{

}
//初始化
-(instancetype)init
{
    if (self = [super init]){
        self.columnMargin = 10;
        self.rowMargin = 10;
        self.sectionInset = UIEdgeInsetsMake(10, 13, 10, 13);
        self.columnCount = 3;
    }
    return self;
}

//每一次布局前的准备工作
-(void)prepareLayout
{
    [super prepareLayout];
    //清空最大的y值
    for (int i =0; i < self.columnCount; i++)
    {
        NSString *column = [NSString stringWithFormat:@"%d",i];
        self.maxYDic[column] = @(self.sectionInset.top);
    }

    //计算所有item的属性
    [self.attrsArray removeAllObjects];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    NSInteger count1 = [self.collectionView numberOfSections];
   
    for(int i = 0;i<count1;i++){
        UICollectionViewLayoutAttributes *attr1 = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader withIndexPath:[NSIndexPath indexPathWithIndex:i]];
        if(attr1){
            [self.attrsArray addObject:attr1];
            if([self.delegate respondsToSelector:@selector(HPFlowLayout:referenceSizeForHeaderInSection:)]){
                __weak typeof(self) this = self;
                CGSize headerSize = [self.delegate HPFlowLayout:this referenceSizeForHeaderInSection:0];
                attr1.frame = CGRectMake(0, i*100, headerSize.width, headerSize.height);
            }
        }
    }
    
    for (int i=0; i<count; i++)
    {
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        
        [self.attrsArray addObject:attrs];
    }
}

//设置collectionView滚动区域
-(CGSize)collectionViewContentSize
{   
    //假设最长的那一列为第0列
    __block NSString *maxColumn = @"0";
    
    //遍历字典,找出最长的那一列
    [self.maxYDic enumerateKeysAndObjectsUsingBlock:^(NSString *column, NSNumber *maxY, BOOL *stop) {
        
        if ([maxY floatValue] > [self.maxYDic[maxColumn] floatValue])
        {
            maxColumn = column;
        }
    }];
    
    CGFloat section = [self.collectionView numberOfSections];
    
    __weak typeof(self)this = self;
    //header高度
    CGFloat height = 0;
    if (self.delegate){
        if([self.delegate respondsToSelector:@selector(HPFlowLayout:referenceSizeForHeaderInSection:)]){
            for (int i = 0 ; i < section; i ++) {
                 height += [self.delegate HPFlowLayout:this referenceSizeForHeaderInSection:i].height;
            }
        }
        
    }
    return CGSizeMake(0, [self.maxYDic[maxColumn]floatValue]+self.sectionInset.bottom+height);
}
//
////允许每一次重新布局
//-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
//{
//    return YES;
//}

//布局每一个属性
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //假设最短的那一列为第0列
    __block NSString *minColumn = @"0";
    
    //遍历字典,找出最短的那一列
    [self.maxYDic enumerateKeysAndObjectsUsingBlock:^(NSString *column, NSNumber *maxY, BOOL *stop) {
        
        if ([maxY floatValue] < [self.maxYDic[minColumn] floatValue])
        {
            minColumn = column;
        }
    }];
    
    //计算每一个item的宽度和高度
    CGFloat width = (self.collectionView.frame.size.width - self.columnMargin*(self.columnCount - 1) - self.sectionInset.left - self.sectionInset.right) / self.columnCount;
    __weak typeof(self)this = self;
	CGFloat height = [self.delegate HPFlowLayout:this heightForWidth:width andIndexPath:indexPath] ;
    
    //计算每一个item的位置
    CGFloat x = self.sectionInset.left + (width + self.columnMargin) * [minColumn floatValue];
    CGFloat y = [self.maxYDic[minColumn] floatValue] + self.rowMargin;
    
    //更新这一列的y值
    self.maxYDic[minColumn] = @(y + height);

    //创建布局属性
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGSize headerSize = CGSizeZero;
    if([self.delegate respondsToSelector:@selector(HPFlowLayout:referenceSizeForHeaderInSection:)]){
        __weak typeof(self) this = self;
        headerSize = [self.delegate HPFlowLayout:this referenceSizeForHeaderInSection:indexPath.section];
    }
    
    //设置item的frame
    attrs.frame = CGRectMake(x, headerSize.height + y, width, height);
    return attrs;
}
//- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionViewLayoutAttributes *attribute = nil;
//    if ([elementKind isEqualToString:UICollectionElementKindSectionHeader]) {
//        attribute = self.attrsArray.firstObject;
//    }else if ([elementKind isEqualToString:UICollectionElementKindSectionHeader]){
////        attribute = self.footLayoutInfo[indexPath];
//    }
//    return attribute;
//}
//布局所有item的属性,包括header、footer
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return [self.attrsArray copy];
}

@end

