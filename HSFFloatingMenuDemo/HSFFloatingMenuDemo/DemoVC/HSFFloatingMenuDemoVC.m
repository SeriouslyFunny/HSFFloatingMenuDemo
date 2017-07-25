//
//  HSFFloatingMenuDemoVC.m
//  HSFFloatingMenuDemo
//
//  Created by JuZhenBaoiMac on 2017/7/25.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import "HSFFloatingMenuDemoVC.h"

#import "HSFFloatingMenu.h"

@interface HSFFloatingMenuDemoVC ()<HSFGBoxMenuDelegate>

@property (nonatomic,strong) HSFFloatingMenu *floatingMenu;

@end

@implementation HSFFloatingMenuDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"HSFFloatingMenuDemoVC";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    self.floatingMenu = [[HSFFloatingMenu alloc]initWithFrame:CGRectMake(0, 100, 50, 50)];
    self.floatingMenu.delegate = self;
    self.floatingMenu.centerImgName = @"floatingMenu";
    self.floatingMenu.source = @[@{@"title":@"",@"icon":@"alarm"},
                                 @{@"title":@"",@"icon":@"audio"},
                                 @{@"title":@"",@"icon":@"basketball"},
                                 @{@"title":@"",@"icon":@"camera"},
                                 @{@"title":@"",@"icon":@"chat"},
                                 @{@"title":@"",@"icon":@"food"},
                                 @{@"title":@"",@"icon":@"game"}];
    self.floatingMenu.startRadian = -M_PI/2;
    self.floatingMenu.endRadian = M_PI/2;
    self.floatingMenu.radius = 20; // 50/2 - k_itemW/2 刚好 = 20 所以在最边上  也可以自定也半径
    self.floatingMenu.multiple = 5;
    [self.floatingMenu setUp];
    
    
    [self.view addSubview:self.floatingMenu];
    
}

-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -HSFFloatingMenuDelegate
-(void)didClickItem:(HSFGBoxMenu *)floatingMenu atIndex:(NSInteger)index{
    NSLog(@"you did click item at -> %ld",(long)index);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
