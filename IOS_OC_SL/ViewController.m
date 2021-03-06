//
//  ViewController.m
//  IOS_OC_SL
//
//  Created by 柯南 on 2021/8/18.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"目录";
    [self configUI];
}

- (void)configUI{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic =self.dataList[indexPath.row];
    NSString *key = [NSString stringWithFormat:@"%@",[dic.allKeys firstObject]];
    Class PageVC = NSClassFromString(dic[key]);
    if (PageVC) {
        UIViewController *pageVC = [[PageVC alloc]init];
        [self.navigationController pushViewController:pageVC animated:true];
    }
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"UITableViewCell"];
    }
    NSDictionary *dic =self.dataList[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[dic.allKeys firstObject]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

#pragma mark - UILzay
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    
    return _tableView;
}

- (NSArray *)dataList{
    if (!_dataList) {
        _dataList = @[@{@"三方库索引":@"PodsLibIndexVC"},@{@"属性":@"PodsLibVC"},@{@"属性":@"PodsLibVC"},@{@"属性":@"PodsLibVC"}];
    }
    return _dataList;
}

@end
