//
//  ViewController.m
//  演练7 ///省份城市plist 加载
//
//  Created by 刘宏立 on 16/6/23.
//  Copyright © 2016年 lhl. All rights reserved.
//

#import "ViewController.h"
#import "HLProvince.h"
//注册可重用cell,身份ID设置为 'cellID'
static NSString *cellId = @"cellId";

//遵守数据源协议,遵守协议是为了能够实现协议的方法,不遵守就没有实施这个方法的权利,同样遵守代理协议也是为了有权利实施代理的方法
@interface ViewController () <UITableViewDataSource>



@end

@implementation ViewController{
    //定义一个成员变量的数组,这个数组中存放的是省份的名字,HLProvince 表示这些省份名字都属于这个类,如果不写这个泛型就不知道 _provinceNameList 是属于哪个类,也就取不出这些省份的名字,拿不到想要的数据
    NSArray <HLProvince *> *_provinceNameList;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    //这个地方先加载数据还是先启动界面效果上没有影响
    [self loadPlistData];
    
    [self setupUI];
}


#pragma mark - UITableViewDataSource 设置数据源
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //这个默认不实现,默认返回值是1; 返回类型是 NSInteger(整型的),这个方法是得到分组的'数量' (numberOfSectionsInTableView:), return 的时候一定返回组的数量
    return _provinceNameList.count;
}

//这个返回类型也是整型的 (NSInteger), 方法是为了返回: 在这个组内的行数 (numberOfRowsInSection:),注意返回的时候一定返回'组内行的数量'
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //取出分组的数据,在这里是取出省份的数据列表
    HLProvince *province = _provinceNameList[section];
    //取出分组的数据后,返回组内成员的数量,即对应组省份城市的数量
    return province.cities.count;
}
//通过索引获得指定行的单元格,以便获得指定单元格每个单元格中的数据,只要有单元格cell的地址索引,我就可以取出索引对应的单元格总的数据内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取cell,前面已经注册了一个cell,身份证明是: cellId,
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    //设置cell
    //1>.取出模型
    HLProvince *province = _provinceNameList[indexPath.section];
    //2>.根据省份取出对应省份的城市名字,根据索引取出撑死对应的名字,城市对应的索引具体到组中的行
    NSString *cityName = province.cities[indexPath.row];
    
    //设置数据,即设置每个单元格cell中的文本内容,这里是将城市的名字添加到单元格中,单元格中将显示城市的名字
    cell.textLabel.text = cityName;
    //返回单元格,这个时候单元格中所存储的数据就是城市的名字
    return cell;
}

//返回值是Nsstring类型的,直接返回省份的名字,这个地方只要返回的数据是你说string的都可以,但是数据必须是 存在的,的上面是将城市的名字存储到tableView的cell中,下面将省份的名字,也就是将section对应的省份设置到组头,
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    //获取模型,获取到模型中的数据,将数据传递给新创建的province对象
    HLProvince *province = _provinceNameList[section];
    
    //返回数据类型,返回新创建的对象的名字,即省份的名字
    
    return province.name;

}

#pragma mark - 增加省份索引
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
//    //索引数组的内容和 实际数据没有任何关系
//    //有关系的是返回数组的下标和 section 数组的下标一一对应
//    return @[@"a", @"c", @"b" ];
    
//    NSMutableArray *names = [NSMutableArray array];
//    for (HLProvince *province in _provinceNameList) {
//        [names addObject:province.name];
//    }
//    return names;
    
    // KVC cocoa大招
    //用一个数组记录一下,后面直接返回 数组 names
    NSArray *names = [_provinceNameList valueForKey:@"name"];
    return names;
}


/**
 *KVC 目前掌握的知识点小结
 
 字典转模型 setValuesForKeysWithDictionary
 使用自定的字典转换成模型
 使用细节：
 如果字典中有对象中不存在的 key，会崩溃
 如果对象属性中有字典中不存在的 key，没有反应
 本质上就是遍历字典 key，然后一个一个的设置数值
 模型转字典 dictionaryWithValuesForKeys
 
 使用指定的属性列表，将模型转换成字典
 注意：字典转模型和模型转字典，默认都只能转换一级模型，嵌套模型还需要增加代码
 KVC 是一种间接设置和取值的技术
 
 设置数值
 [self setValue:dict[@"name"] forKey:@"name"];
 取值
 [_provinceList valueForKey:@"name"];
 如果发送消息的对象就是一个对象，则返回对象的属性值
 如果发送消息的对象是一个数组，返回 key 对应属性的数组
 **/



#pragma mark - loadData 加载数据
//模型设置完毕之后加载数据
- (void)loadPlistData{
    //从本地加载数据,用Bundle,Bundle专门用于加载本地数据,加载的数据资源是 'cities.plist', 字符串用 '@' 引起来.
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"cities.plist" withExtension:nil];
    //将url中的数据传递给新创建的数组 list
    NSArray *list = [NSArray arrayWithContentsOfURL:url];
    
    //创建一个数组,用来保存下面遍历的字典成员
    NSMutableArray *arrayM = [NSMutableArray array];
    //便利字典
    for (NSDictionary *dict in list) {
        //将字典添加到可变数组 arrayM
        [arrayM addObject:[[HLProvince alloc] initWithDict:dict]];
        
    }
    //copy之后,记录到成员变量,copy后就将数组由可变的转变为不可变的
    _provinceNameList = arrayM.copy;

}


- (void)setupUI{
    //创建一个tableView,大小为陪你过目的大小,风格是Plain
    UITableView *tv = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //将新创建的tableView表格视图添加到当前控制器的视图上,直译就是:当前控制器的视图 获得(get) tableView视图(tv)
    [self.view addSubview:tv];
    
    //注册可重用单元格,这个可充用单元格的身份ID就设置为 'cellId'
    [tv registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    
    
    //设置数据源
    tv.dataSource = self;
    
}

@end
