//
//  KKTableView.h
//  KKTableView
//
//  Created by KKWONG on 2020/8/26.
//  Copyright © 2020 KKWONG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>
#import "KKTableViewDataSource.h"
#import "KKListEmptyView.h"
@class KKTableView;
@class KKListEmptyView;
@class KKSectionCreator;
@class KKEmptyEntityCreator;
NS_ASSUME_NONNULL_BEGIN
@protocol KKTableViewProtocol <NSObject>
@optional
/* 头部刷新代理方法 */
- (void)tableViwe:(KKTableView *)tableView headerRefresing:(NSInteger)page;
/* 尾部刷新代理方法 */
- (void)tableViwe:(KKTableView *)tableView footerRefresing:(NSInteger)page;
/* 重新请求数据代理方法 */
- (void)tableView:(KKTableView *)tableView startingReloadData:(NSInteger)page;
@end

@interface KKTableView : UITableView

/// 数据源对象
@property (nonatomic, strong, readonly) KKTableViewDataSource * kDatasource;

/// 空数据视图对象
@property (nonatomic, strong, readonly) KKListEmptyView * kEmptyView;

/// 自定义空数据视图对象
@property (nonatomic, strong, readonly) UIView * kCustomEmptyView;

/// 初始化表格视图
+ (KKTableView *(^)(CGRect frame, UITableViewStyle style))init;

/// 遵守协议KKTableViewProtocol，传入遵守协议的对象
- (KKTableView *(^)(NSObject * obj))conformsProtocol;

/// 添加一个分区，传入一个KKSectionCreator
- (KKTableView *(^)(KKSectionCreator * sectionCreator))addSection;

/// 添加头部刷新 - 传入Nil表示使用默认头部刷新控件，传入YES表示马上刷新数据
- (KKTableView *(^)(MJRefreshHeader * _Nullable refreshHeader, BOOL isBeginRefreshing))addHeaderRefresh;

/// 添加尾部刷新 - 传入Nil表示使用默认头部刷新控件，传入YES表示马上刷新数据
- (KKTableView *(^)(MJRefreshFooter * _Nullable refreshFooter, BOOL isBeginRefreshing))addFooterRefresh;

/// 结束刷新
- (KKTableView *(^)(void))endRefresh;

/// 结束刷新且自动重载数据
- (KKTableView *(^)(void))endRefreshWithReload;

/// 开始显示加载指示器
- (KKTableView *(^)(void))startLoading;

/// 结束显示加载指示器
- (KKTableView *(^)(void))endLoading;

/// 设置空视图
- (KKTableView *(^)(KKEmptyEntityCreator * emptyCreator))emptyView;

/// 自定义空视图
- (KKTableView *(^)(UIView * emptyView))customEmptyView;

- (KKTableView *(^)(NSArray<NSString *> * titles))addSectionIndexTitles;

/// 请求错误通知
- (KKTableView *(^)( NSString * _Nullable errorImageName, NSString * _Nullable errorTitle, NSString * _Nullable errorDetail))errorNotice;

@end



NS_ASSUME_NONNULL_END
