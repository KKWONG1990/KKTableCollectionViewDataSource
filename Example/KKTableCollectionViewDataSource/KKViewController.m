//
//  KKViewController.m
//  KKTableCollectionViewDataSource
//
//  Created by KKWONG1990 on 10/02/2020.
//  Copyright (c) 2020 KKWONG1990. All rights reserved.
//

#import "KKViewController.h"
#import "TableViewCell.h"
#import <KKTableCollectionViewDatasource.h>
@interface KKViewController ()<KKTableViewProtocol>
@property (nonatomic, strong) NSMutableArray * datas;
@end

@implementation KKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datas = [NSMutableArray arrayWithObjects:@"11", @"22", @"33", @"44", @"55", nil];
    KKTableView *tableView = KKTableView.init(self.view.frame, UITableViewStylePlain)
                                        .conformsProtocol(self)
                                        .addHeaderRefresh(nil, NO)
                                        .addFooterRefresh(nil, NO)
                                        .emptyView(KKEmptyEntityCreator.init())
                                        .addSection(KKSectionCreator
                                                    .init()
                                                    .cellClass([TableViewCell class])
                                                    .datasource((NSArray *)self.datas)
                                                    .identifier(@"cellid")
                                                    .rowHeight(50)
//                                                    .headerView([self titleView:@"headerView"])
//                                                    .footerView([self titleView:@"footerView"])
                                                    .headerHeight(50)
                                                    .footerHeight(50)
                                                    .didSelectRowAtIndexPath(^(NSString * data, NSIndexPath * indexPath){
                                            NSLog(@"data = %@",data);
                                        })
                                                    .cellForRowBlock(^(TableViewCell * cell,
                                                                       NSString * data,
                                                                       NSIndexPath * indexPath) {
                                                                        cell.textLabel.text = data;})
                                                    
                                                    );
    [self.view addSubview:tableView];
    [tableView reloadData];
}

- (void)tableViwe:(KKTableView *)tableView headerRefresing:(NSInteger)page {
    if (self.datas.count) {
        [self.datas removeAllObjects];
    } else {
        tableView.errorNotice(@"",@"请求发生错误", @"点击重试");
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        tableView.endRefresh();
        [tableView reloadData];
    });
}

- (void)tableViwe:(KKTableView *)tableView footerRefresing:(NSInteger)page {
    
    
    
    
    NSInteger currnetPage = page;
    NSInteger maxNumber = page+3;
    for (NSInteger i = currnetPage; i < maxNumber; i++) {
        [self.datas addObject:[NSString stringWithFormat:@"%ld",(long)i]];
        NSLog(@"self,.datas = %@",self.datas);
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        tableView.endRefreshWithReload();
        
    });
}

- (void)tableView:(KKTableView *)tableView startingReloadData:(NSInteger)page {
    NSLog(@"开始请求数据");
    tableView.startLoading();
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        tableView.endLoading();
        tableView.errorNotice(@"",@"请求发生错误", @"点击重试");
    });
}

- (UIView *)titleView:(NSString *)title {
    UIView * titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:titleView.frame];
    titleLabel.text = title;
    [titleView addSubview:titleLabel];
    return titleView;
}


@end
