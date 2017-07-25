//
//  ViewController.m
//  HSFFloatingMenuDemo
//
//  Created by JuZhenBaoiMac on 2017/7/25.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import "ViewController.h"

#import "HSFGBoxMenuDemoVC.h"
#import "HSFFloatingMenuDemoVC.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"HSFGBoxMenu";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    /* 配置tableView */
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 50;
    
    
}

#pragma mark -UITableViewDelegate, UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"HSFGBoxMenuDemo";
    }
    else if (indexPath.row == 1) {
        cell.textLabel.text = @"HSFFloatingMenuDemo";
    }
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        HSFGBoxMenuDemoVC *vc = [[HSFGBoxMenuDemoVC alloc]init];
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
        [self presentViewController:navi animated:YES completion:nil];
    }
    else if (indexPath.row == 1) {
        HSFFloatingMenuDemoVC *vc = [[HSFFloatingMenuDemoVC alloc]init];
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
        [self presentViewController:navi animated:YES completion:nil];
    }
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
