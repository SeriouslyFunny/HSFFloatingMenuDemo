//
//  HSFGBoxMenu.m
//  HSFFloatingMenuDemo
//
//  Created by JuZhenBaoiMac on 2017/7/25.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import "HSFGBoxMenu.h"



@interface HSFGBoxMenu ()


@property (nonatomic,strong) UIImageView *centerImgView;


@end

@implementation HSFGBoxMenu

//初始化方法
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        self.contentView.frame = CGRectMake(0, 0, frame.size.width, frame.size.width);
        self.contentView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
        self.contentView.layer.masksToBounds = YES;
        self.contentView.layer.cornerRadius = self.contentView.frame.size.width/2;
        [self addSubview:self.contentView];
        
        self.centerImgView.frame = CGRectMake(0, 0, frame.size.width - k_itemW, frame.size.width - k_itemW);
        self.centerImgView.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        self.centerImgView.layer.masksToBounds = YES;
        self.centerImgView.layer.cornerRadius = self.centerImgView.frame.size.width/2;
        self.centerImgView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.centerImgView.layer.borderWidth = 2;
        [self addSubview:self.centerImgView];
        
        
        //默认
        self.startRadian = 0.00;
        self.endRadian = 2*M_PI;
        self.radius = frame.size.width/2 - k_itemW/2;
        self.multiple = 5.0;
        self.isOpen = NO;
        
        //添加手势
        //单击张开收起
        self.centerImgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(centerImgViewACTION)];
        [self.centerImgView addGestureRecognizer:tap];
    }
    return self;
}

#pragma mark -重写frame 固定为正方形（据width而定）
-(void)setFrame:(CGRect)frame{
    CGRect newFrame = frame;
    newFrame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.width);
    [super setFrame:newFrame];
}

#pragma mark -setUp
-(void)setUp{
    self.centerImgView.image = [UIImage imageNamed:self.centerImgName];
    
    //添加items
    if (self.radius > self.frame.size.width/2 - k_itemW/2) {
        self.radius = self.frame.size.width/2 - k_itemW/2;
    }
    CGFloat w = k_itemW;
    CGFloat h = k_itemW;
    double allRadian = ABS(self.endRadian - self.startRadian);
    for (int i = 0; i < self.source.count; i++) {
        UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
        double radian = 0.00;
        if (allRadian < 2*M_PI) {
            radian = allRadian/(self.source.count - 1) * i + self.startRadian;
        }else {
            radian = 2*M_PI/(self.source.count) * i + self.startRadian;
        }
        CGFloat x = self.radius * cos(radian) + self.frame.size.width/2;
        CGFloat y = self.radius * sin(radian) + self.frame.size.width/2;
        item.frame = CGRectMake(0, 0, w, h);
        item.center = CGPointMake(x, y);
        
        NSDictionary *dic = self.source[i];
        [item setImage:[UIImage imageNamed:dic[@"icon"]] forState:UIControlStateNormal];
        [item setTag:(666 + i)];
        [item addTarget:self action:@selector(clickItemACTION:) forControlEvents:UIControlEventTouchUpInside];
        item.alpha = 0.0;
        [self.contentView addSubview:item];
        [self.itemsArr addObject:item];
    }
}

#pragma mark -点击centerImgView
-(void)centerImgViewACTION{
    self.isOpen = !self.isOpen;
    if (self.isOpen) {
        [self show];
    }else{
        [self hide];
    }
}
#pragma mark -展开
-(void)show{
    [UIView animateWithDuration:0.2 animations:^{
        self.transform = CGAffineTransformScale(self.transform, self.multiple, self.multiple);
        self.centerImgView.transform = CGAffineTransformScale(self.centerImgView.transform, 1/self.multiple, 1/self.multiple);
        [self.itemsArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *item = (UIButton *)obj;
            item.alpha = 1.0;
        }];
    }completion:^(BOOL finished) {
        
    }];
}
#pragma mark -收起
-(void)hide{
    [UIView animateWithDuration:0.2 animations:^{
        self.transform = CGAffineTransformIdentity;
        self.centerImgView.transform = CGAffineTransformIdentity;
        [self.itemsArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *item = (UIButton *)obj;
            item.alpha = 0.0;
        }];
    }completion:^(BOOL finished) {
        
    }];
}

#pragma mark -点击item
-(void)clickItemACTION:(UIButton *)sender{
    [self centerImgViewACTION];
    if ([self.delegate respondsToSelector:@selector(didClickItem:atIndex:)]) {
        [self.delegate didClickItem:self atIndex:sender.tag - 666];
    }
}


#pragma mark -懒加载
-(UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc]init];
    }
    return _contentView;
}
-(UIImageView *)centerImgView{
    if (!_centerImgView) {
        _centerImgView = [[UIImageView alloc]init];
        _centerImgView.contentMode = UIViewContentModeCenter;
    }
    return _centerImgView;
}
-(NSMutableArray *)itemsArr{
    if (!_itemsArr) {
        _itemsArr = [NSMutableArray array];
    }
    return _itemsArr;
}

@end
