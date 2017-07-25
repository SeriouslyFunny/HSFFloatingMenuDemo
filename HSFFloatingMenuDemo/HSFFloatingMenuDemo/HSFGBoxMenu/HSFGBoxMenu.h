//
//  HSFGBoxMenu.h
//  HSFFloatingMenuDemo
//
//  Created by JuZhenBaoiMac on 2017/7/25.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import <UIKit/UIKit.h>

//item初始大小
#define k_itemW 10

@class HSFGBoxMenu;
@protocol HSFGBoxMenuDelegate <NSObject>

@optional

-(void)didClickItem:(HSFGBoxMenu *)floatingMenu atIndex:(NSInteger)index;

@end

@interface HSFGBoxMenu : UIView
/* 这些属性可以不用动,用在了HSFFloatingMenu里 */
@property (nonatomic,assign) BOOL isOpen;
@property (nonatomic,strong) NSMutableArray *itemsArr;
@property (nonatomic,assign) CGPoint startPoint;
@property (nonatomic,strong) UIView *contentView;

/* 以下是需要配置的属性 */
@property (nonatomic,strong) NSString *centerImgName;//中心按钮image
@property (nonatomic,strong) NSArray *source;//数据源 @[@{@"title":@"",@"icon":@""}, ...]
@property (nonatomic,assign) CGFloat radius;//半径
@property (nonatomic,assign) double startRadian;//开始弧度
@property (nonatomic,assign) double endRadian;//结束弧度
@property (nonatomic,assign) double multiple;//缩放倍数(>=1)
@property (nonatomic,assign) id<HSFGBoxMenuDelegate>delegate;


#pragma mark -setUp（设置完属性后必须setUp）
-(void)setUp;
#pragma mark -展开
-(void)show;
#pragma mark -收起
-(void)hide;

@end
