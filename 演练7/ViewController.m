//
//  ViewController.m
//  演练7 ///省份城市plist 加载
//
//  Created by 刘宏立 on 16/6/23.
//  Copyright © 2016年 lhl. All rights reserved.
//

#import "ViewController.h"
#import "HLProvince.h"
//注册可重用cell
static NSString *cellId = @"cellId";

@interface ViewController () <UITableViewDataSource>



@end

@implementation ViewController{
    NSArray <NSDictionary *>*dict;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //这个默认不实现,默认返回值是1;
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    //设置cell
//    cell.textLabel.text = 
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    //获取模型
    
    //返回数据类型
    
    return 0;

}


- (void)setupUI{
    
    UITableView *tv = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:tv];
    
    
    [tv registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    
    
    //设置数据源
    tv.dataSource = self;

}

@end
