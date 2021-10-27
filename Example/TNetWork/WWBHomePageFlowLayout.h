//
//  WWBHomePageFlowLayout.h
//  Business
//
//  Created by 林海生 on 2018/5/25.
//  Copyright © 2018年 prince. All rights reserved.
//
#import <UIKit/UIKit.h>

/*
 为了体现封装性的特点,我们可以把一些数据设置为公共的，既可以提高扩展性和通用性，
 也便于外界按照自己的需求做必要的调整。
 */

@protocol WWBHomePageLayoutDelegate;

@class HomePageLayout;

@interface WWBHomePageFlowLayout : UICollectionViewLayout

@property (nonatomic, assign) CGSize headerReferenceSize;
@property (assign,nonatomic) CGFloat columnMargin;//每一列item之间的间距
@property (assign,nonatomic) CGFloat rowMargin;   //每一行item之间的间距
@property (assign,nonatomic) UIEdgeInsets sectionInset;//设置于collectionView边缘的间距
@property (assign,nonatomic) NSInteger columnCount;//设置每一行排列的个数
@property (weak,nullable)id<WWBHomePageLayoutDelegate> delegate; //设置代理
@end



@protocol WWBHomePageLayoutDelegate<NSObject>
-(CGFloat)HPFlowLayout:(__weak WWBHomePageFlowLayout *_Nullable) HPFlowLayout heightForWidth:(CGFloat)width andIndexPath:(NSIndexPath *_Nullable)indexPath;

//设置Header高度
- (CGSize)HPFlowLayout:(__weak WWBHomePageFlowLayout *_Nullable)HPFlowLayout referenceSizeForHeaderInSection:(NSInteger)section;


@end
