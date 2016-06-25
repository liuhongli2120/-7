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
    NSArray <HLProvince *> *_provinceNameList;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadPlistData];
    
    [self setupUI];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //这个默认不实现,默认返回值是1;
    return _provinceNameList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    HLProvince *province = _provinceNameList[section];
    
    return province.cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    //设置cell
    //1>.取出模型
    HLProvince *province = _provinceNameList[indexPath.section];
    //2>.根据省份取出对应省份的城市名字
    NSString *cityName = province.cities[indexPath.row];
    
    //设置数据
    cell.textLabel.text = cityName;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    //获取模型
    
    //返回数据类型
    
    return 0;

}


//模型设置完毕之后加载数据
- (void)loadPlistData{
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"cities.plist" withExtension:nil];
    NSArray *list = [NSArray arrayWithContentsOfURL:url];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in list) {
        
        [arrayM addObject:[[HLProvince alloc] initWithDict:dict]];
        
    }
    _provinceNameList = arrayM.copy;

}


- (void)setupUI{
    
    UITableView *tv = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:tv];
    
    
    [tv registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    
    
    //设置数据源
    tv.dataSource = self;
//    _provinceNameList = ;

}

@end
