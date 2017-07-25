//
//  HSFFloatingMenu.m
//  HSFFloatingMenuDemo
//
//  Created by JuZhenBaoiMac on 2017/7/25.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import "HSFFloatingMenu.h"

@implementation HSFFloatingMenu



#pragma mark -touch
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (self.isOpen) {
        return;
    }
    
    //保存触摸起始点位置
    CGPoint point = [[touches anyObject] locationInView:self];
    self.startPoint = point;
    
    //该view置于最前
    [[self superview] bringSubviewToFront:self];
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if (self.isOpen) {
        return;
    }
    
    //计算位移=当前位置-起始位置
    CGPoint point = [[touches anyObject] locationInView:self];
    float dx = point.x - self.startPoint.x;
    float dy = point.y - self.startPoint.y;
    
    //计算移动后的view中心点
    CGPoint newcenter = CGPointMake(self.center.x + dx, self.center.y + dy);
    
    
    /* 限制用户不可将视图托出屏幕 */
    float halfx = CGRectGetMidX(self.bounds);
    //x坐标左边界
    newcenter.x = MAX(halfx, newcenter.x);
    //x坐标右边界
    newcenter.x = MIN(self.superview.bounds.size.width - halfx, newcenter.x);
    
    //y坐标同理
    float halfy = CGRectGetMidY(self.bounds);
    newcenter.y = MAX(halfy, newcenter.y);
    newcenter.y = MIN(self.superview.bounds.size.height - halfy, newcenter.y);
    
    //移动view
    self.center = newcenter;
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.isOpen) {
        return;
    }
    
    CGPoint center = self.center;
    if (center.x < self.superview.frame.size.width/2) {
        center.x = self.frame.size.width/2;
    }
    if (center.x >= self.superview.frame.size.width/2) {
        center.x = self.superview.frame.size.width - self.frame.size.width/2;
    }
    if (center.y < self.frame.size.height/2) {
        center.y = self.frame.size.height/2;
    }
    if (center.y >= self.superview.frame.size.height - self.frame.size.height/2) {
        center.y = self.superview.frame.size.height - self.frame.size.height/2;
    }
    [UIView animateWithDuration:0.2 animations:^{
        self.center = center;
    }];
    //调整item的位置
    if (self.center.x < self.superview.frame.size.width/2) {
        [self changeItemsFrameWithSide:@"left"];
    }else{
        [self changeItemsFrameWithSide:@"right"];
    }
}
//调整item的位置
-(void)changeItemsFrameWithSide:(NSString *)side{
    if ([side isEqualToString:@"left"]) {
        self.startRadian = -M_PI/2;
        self.endRadian = M_PI/2;
    }
    else if ([side isEqualToString:@"right"]) {
        self.startRadian = M_PI/2;
        self.endRadian = M_PI/2 * 3;
    }
    
    //添加items
    if (self.radius > self.frame.size.width/2 - k_itemW/2) {
        self.radius = self.frame.size.width/2 - k_itemW/2;
    }
    CGFloat w = k_itemW;
    CGFloat h = k_itemW;
    double allRadian = ABS(self.endRadian - self.startRadian);
    for (int i = 0; i < self.itemsArr.count; i++) {
        UIButton *item;
        if ([side isEqualToString:@"left"]) {//正序
            item = [self.contentView viewWithTag:(i + 666)];
        }
        else if ([side isEqualToString:@"right"]) {//倒序
            item = [self.contentView viewWithTag:(666 + self.itemsArr.count - 1 - i)];
        }
        double radian = 0.00;
        if (allRadian < 2*M_PI) {
            radian = allRadian/(self.itemsArr.count - 1) * i + self.startRadian;
        }else {
            radian = 2*M_PI/(self.itemsArr.count) * i + self.startRadian;
        }
        CGFloat x = self.radius * cos(radian) + self.frame.size.width/2;
        CGFloat y = self.radius * sin(radian) + self.frame.size.width/2;
        item.frame = CGRectMake(0, 0, w, h);
        item.center = CGPointMake(x, y);
    }
}



@end
