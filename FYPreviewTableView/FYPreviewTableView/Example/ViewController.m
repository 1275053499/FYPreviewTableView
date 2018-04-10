//
//  ViewController.m
//  FYPreviewTableView
//
//  Created by xfy on 2018/4/9.
//  Copyright © 2018年 xfy. All rights reserved.
//

#import "ViewController.h"
#import "FYPreviewTableView.h"
#import "TestTableViewCell.h"
static NSString *identifier = @"TestTableViewCell";
@interface ViewController ()<UITableViewDelegate,FYPreviewTableViewDataSource>
@property (nonatomic,strong)NSMutableArray *modelArray;
@property (nonatomic,strong)FYPreviewTableView *tableView;
@end

@implementation ViewController
- (NSMutableArray *)modelArray
{
    if (!_modelArray) {
        _modelArray = [NSMutableArray array];
    }
    return _modelArray;
}

- (FYPreviewTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[FYPreviewTableView alloc] initWithFrame:self.view.bounds];
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 95;
        _tableView.delegate = self;
        _tableView.fyDataSoure = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self performSelector:@selector(loadData) withObject:nil afterDelay:2];
}

//模拟网络数据返回 延时两秒
- (void)loadData
{
    for (int i = 0; i < 10 ; i++) {
        [self.modelArray addObject:@"这是一条测试数据"];
    }
    [_tableView reloadData];
}

- (NSInteger)fYPreviewTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.modelArray.count;
}

- (UITableViewCell *)fYPreviewTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[TestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell updata:self.modelArray[indexPath.row]];
    return cell;
}

- (UITableViewCell *)registerCell
{
    return [[TestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
