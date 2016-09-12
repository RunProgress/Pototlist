//
//  ViewController.m
//  XuanZhuanAnimationView
//
//  Created by zhang on 16/1/27.
//  Copyright © 2016年 zhang. All rights reserved.
//

#import "ViewController.h"
#import "RefreshAnimationView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    // Do any additional setup after loading the view, typically from a nib.
    RefreshAnimationView *refreshView = [[RefreshAnimationView alloc] initWithFrame:CGRectMake(100, 200, 28, 28)];
    [self.view addSubview:refreshView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
