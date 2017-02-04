//
//  newsController.m
//  ReactiveCocoa_Demo
//
//  Created by Transuner on 2017/2/4.
//  Copyright © 2017年 吴冰. All rights reserved.
//

#import "newsController.h"
#import "newsViewModel.h"
#import "MJRefresh.h"
#import "newsCell.h"
#import "newsView.h"
#import "newsNavigationController.h"
#import "LoginController.h"

@interface newsController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) newsViewModel * viewModel;
@property (nonatomic, strong) newsView      * news_View;
@property (nonatomic, strong) UITableView   * table;
@end

@implementation newsController

- (newsViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[newsViewModel alloc]init];
    }
    return _viewModel;
}

- (newsView *)news_View {
    if (!_news_View) {
        _news_View = [[newsView alloc]initWithFrame:CGRectMake(0, 0, S_SCREEN_WIDTH, 180)];
        _news_View.backgroundColor = [UIColor orangeColor];
    }
    return _news_View;
}

- (UITableView *)table {
    if (!_table) {
        UITableView * table = [[UITableView alloc]init];
        table.frame = CGRectMake(0, 0, S_SCREEN_WIDTH, S_SCREEN_HEIGHT - 64);
        table.delegate   = self;
        table.dataSource = self;
        table.tableHeaderView = self.news_View;
        [self.view addSubview:_table = table];
    }
    return _table;
}

- (void)downData {
    @weakify(self);
    [self.viewModel.updateNewsSignal subscribeNext:^(id x) {
        @strongify(self);
        [self.table.header endRefreshing];
        [self.table.footer endRefreshing];
        [self.table reloadData];
    }];
}

- (void)pullData {
    @weakify(self);
    [self.viewModel.updateMoreSignal subscribeNext:^(id x) {
        @strongify(self);
        [self.table.header endRefreshing];
        [self.table.footer endRefreshing];
        [self.table reloadData];
    }];
}

- (void)setupViews {
    @weakify(self);
    [[self rac_signalForSelector:@selector(tableView:didSelectRowAtIndexPath:) fromProtocol:@protocol(UITableViewDelegate)]subscribeNext:^(RACTuple * x) {
        NSIndexPath *index = x.second;
        NSLog(@"%s,Cell被点击了 :%ld",__FUNCTION__,index.row);
        [self.viewModel.cellClickSubJect sendNext:nil];
    }];
    
    [self.viewModel.updateAdvertisingSignal subscribeNext:^(NSArray * advers) {
        @strongify(self);
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.news_View.cycleScrollView.imageURLStringsGroup = advers;
        });
    }];
    
    [self.table registerClass:[newsCell class] forCellReuseIdentifier:CellID];
    [self.table addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(downData)];
    [self.table addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(pullData)];
    [self.table.header beginRefreshing];
}

-(void)bindViewModel{
    
    @weakify(self);
    [[self.viewModel.cellClickSubJect takeUntil:self.rac_willDeallocSignal ]subscribeNext:^(id x) {
        
        @strongify(self);
        LoginController *loginVC = [[LoginController alloc]init];
        loginVC.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"WBBAN"]];
        [self.navigationController pushViewController:loginVC animated:YES];
        
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    [self bindViewModel];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.newsList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    newsCell * cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    [cell setCellData:(newsModel*)self.viewModel.newsList[indexPath.item]];
    return cell;
}
@end
