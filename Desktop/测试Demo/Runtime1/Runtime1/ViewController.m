//
//  ViewController.m
//  Runtime1
//
//  Created by 王猛 on 2017/8/23.
//  Copyright © 2017年 WM. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+Action.h"
#import "TestClass.h"
#import "WMRuntimeTool.h"
#import "TestTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button1 = [UIButton createBtnWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 100, 300, 50) title:@"runtime获取类的所有属性" actionBlock:^(UIButton *button) {
        NSMutableArray *propertyArray = [WMRuntimeTool getPropertyList:[TestClass class]];
        NSLog(@"propertyArray-->%@",propertyArray);
        
    }];
    button1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button1];

    
    UIButton *button2 = [UIButton createBtnWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 160, 300, 50) title:@"runtime获取类的所有方法名" actionBlock:^(UIButton *button) {
        
        NSMutableArray *methodArray = [WMRuntimeTool getPrivateAPi:[TestClass class]];
        
        NSLog(@"methodArray-->%@",methodArray);
        
    }];
    button2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton createBtnWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 220, 300, 50) title:@"runtime获取类的所有协议" actionBlock:^(UIButton *button) {
        
        NSMutableArray *protocolArray = [WMRuntimeTool getProtocolList:[TestClass class]];
        
        NSLog(@"protocolArray-->%@",protocolArray);
        
    }];
    button3.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton createBtnWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 280, 300, 50) title:@"runtime获取类的所有成员变量" actionBlock:^(UIButton *button) {
        
        NSMutableArray *ivarArray = [WMRuntimeTool getIvarList:[TestClass class]];
        
        NSLog(@"ivarArray-->%@",ivarArray);
        
    }];
    button4.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button4];
    
    UIButton *button5 = [UIButton createBtnWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 340, 300, 50) title:@"runtime获取类的所有成员变量" actionBlock:^(UIButton *button) {
        
        //方法交换 测试
        [self presentViewController:[TestTableViewController new] animated:YES completion:nil];
        
    }];
    button5.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button5];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
