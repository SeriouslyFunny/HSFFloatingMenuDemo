//
//  HSFGBoxMenuDemoVC.m
//  HSFFloatingMenuDemo
//
//  Created by JuZhenBaoiMac on 2017/7/25.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import "HSFGBoxMenuDemoVC.h"

#import "HSFGBoxMenu.h"

@interface HSFGBoxMenuDemoVC ()<HSFGBoxMenuDelegate>

@property (nonatomic,strong) HSFGBoxMenu *GBoxMenu1;
@property (nonatomic,strong) HSFGBoxMenu *GBoxMenu2;
@property (nonatomic,strong) HSFGBoxMenu *GBoxMenu3;

@end

@implementation HSFGBoxMenuDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"HSFGBoxMenuDemoVC";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    
    /* GBoxMenu1 */
    self.GBoxMenu1 = [[HSFGBoxMenu alloc]initWithFrame:CGRectMake(0, 200, 50, 50)];
    self.GBoxMenu1.delegate = self;
    self.GBoxMenu1.centerImgName = @"floatingMenu";
    self.GBoxMenu1.source = @[@{@"title":@"",@"icon":@"alarm"},
                                 @{@"title":@"",@"icon":@"audio"},
                                 @{@"title":@"",@"icon":@"basketball"},
                                 @{@"title":@"",@"icon":@"camera"},
                                 @{@"title":@"",@"icon":@"chat"},
                                 @{@"title":@"",@"icon":@"food"},
                                 @{@"title":@"",@"icon":@"game"}];
    self.GBoxMenu1.startRadian = -M_PI/2;
    self.GBoxMenu1.endRadian = M_PI/2;
    self.GBoxMenu1.radius = 20; // 50/2 - k_itemW/2 刚好 = 20 所以在最边上  也可以自定也半径
    self.GBoxMenu1.multiple = 5;
    [self.GBoxMenu1 setUp];
    
    [self.view addSubview:self.GBoxMenu1];
    
    
    /* GBoxMenu2 */
    self.GBoxMenu2 = [[HSFGBoxMenu alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2 - 50/2, self.view.frame.size.height - 50, 50, 50)];
    
    self.GBoxMenu2.delegate = self;
    self.GBoxMenu2.centerImgName = @"floatingMenu";
    self.GBoxMenu2.source = @[@{@"title":@"",@"icon":@"alarm"},
                              @{@"title":@"",@"icon":@"audio"},
                              @{@"title":@"",@"icon":@"basketball"},
                              @{@"title":@"",@"icon":@"camera"},
                              @{@"title":@"",@"icon":@"chat"},
                              @{@"title":@"",@"icon":@"food"},
                              @{@"title":@"",@"icon":@"game"}];
    self.GBoxMenu2.startRadian = M_PI;
    self.GBoxMenu2.endRadian = 2*M_PI;
    self.GBoxMenu2.radius = 20; // 50/2 - k_itemW/2 刚好 = 20 所以在最边上  也可以自定也半径
    self.GBoxMenu2.multiple = 5;
    [self.GBoxMenu2 setUp];
    
    [self.view addSubview:self.GBoxMenu2];
    
    
    /* GBoxMenu3 */
    self.GBoxMenu3 = [[HSFGBoxMenu alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 50, 200, 50, 50)];
    self.GBoxMenu3.delegate = self;
    self.GBoxMenu3.centerImgName = @"floatingMenu";
    self.GBoxMenu3.source = @[@{@"title":@"",@"icon":@"alarm"},
                              @{@"title":@"",@"icon":@"audio"},
                              @{@"title":@"",@"icon":@"basketball"},
                              @{@"title":@"",@"icon":@"camera"},
                              @{@"title":@"",@"icon":@"chat"},
                              @{@"title":@"",@"icon":@"food"},
                              @{@"title":@"",@"icon":@"game"}];
    self.GBoxMenu3.startRadian = M_PI/2;
    self.GBoxMenu3.endRadian = M_PI/2 * 3;
    self.GBoxMenu3.radius = 20; // 50/2 - k_itemW/2 刚好 = 20 所以在最边上  也可以自定也半径
    self.GBoxMenu3.multiple = 5;
    [self.GBoxMenu3 setUp];
    
    [self.view addSubview:self.GBoxMenu3];
    
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
