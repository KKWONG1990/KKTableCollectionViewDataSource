//
//  KKTableView.m
//  KKTableView
//
//  Created by KKWONG on 2020/8/26.
//  Copyright © 2020 KKWONG. All rights reserved.
//

#import "KKTableView.h"
#import "KKSectionCreator.h"
#import "KKEmptyEntityCreator.h"
@interface KKTableView()
@property (nonatomic, weak) id<KKTableViewProtocol> kProtocol;
@property (nonatomic, strong, readwrite) KKTableViewDataSource * kDatasource;
@property (nonatomic, strong, readwrite) KKListEmptyView * kEmptyView;
@property (nonatomic, strong, readwrite) UIView * kCustomEmptyView;
@end

@implementation KKTableView
{
    __block NSInteger _pageNum;
}
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        _pageNum = 1;
        self.delegate   = self.kDatasource;
        self.dataSource = self.kDatasource;
        self.estimatedSectionFooterHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.tableFooterView = [UIView new];
    }
    return self;
}

+ (KKTableView * _Nonnull (^)(CGRect, UITableViewStyle))init {
    return ^(CGRect frame, UITableViewStyle style){
        return [[[self class] alloc] initWithFrame:frame style:style];
    };
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGSize tableViewSize            = self.frame.size;
    CGFloat tableHeaderViewHeight   = CGRectGetHeight(self.tableHeaderView.frame);
    CGRect emptyViewFrame           = CGRectMake(0,
                                                 tableHeaderViewHeight,
                                                 tableViewSize.width,
                                                 tableViewSize.height - tableHeaderViewHeight);
    if (self.kCustomEmptyView) {
        self.kCustomEmptyView.frame = emptyViewFrame;
    } else {
        self.kEmptyView.frame = emptyViewFrame;
    }
}

- (KKTableView * _Nonnull (^)(NSObject * _Nonnull))conformsProtocol {
    return ^(NSObject * obj){
        self.kProtocol = (id)obj;
        return self;
    };
}

- (void)registerCellWithSectionCreator:(KKSectionCreator *)sectionCreator {
    if (sectionCreator.section.cellClass) {
        [self registerClass:sectionCreator.section.cellClass forCellReuseIdentifier:sectionCreator.section.identifier];
    } else {
        [self registerNib:sectionCreator.section.cellNib forCellReuseIdentifier:sectionCreator.section.identifier];
    }
}

- (NSUInteger)datasourceCount {
    NSUInteger count = 0;
    if (self.kDatasource.sectionCreators == nil || self.kDatasource.sectionCreators.count == 0) return count;
    for (KKSection * section in self.kDatasource.sectionCreators) {
        count += section.datasource.count;
    }
    return count;
}

- (KKTableView * _Nonnull (^)(KKSectionCreator * _Nonnull))addSection {
    return ^(KKSectionCreator * sectionCreator){
        [self registerCellWithSectionCreator:sectionCreator];
        [self.kDatasource.sectionCreators addObject:sectionCreator];
        return self;
    };
}

#pragma mark - 相应代理回调
- (void)headerRefreshStart {
    if (self.kProtocol && [self.kProtocol respondsToSelector:@selector(tableViwe:headerRefresing:)]) {
        _pageNum = 1;
        [self.kProtocol tableViwe:self headerRefresing:_pageNum];
    }
}

- (void)footerRefreshStart {
    if (self.kProtocol && [self.kProtocol respondsToSelector:@selector(tableViwe:footerRefresing:)]) {
        _pageNum += 1;
        [self.kProtocol tableViwe:self footerRefresing:_pageNum];
    }
}

#pragma mark - 加载控件

- (KKTableView * _Nonnull (^)(MJRefreshHeader * _Nullable, BOOL))addHeaderRefresh {
    return ^(MJRefreshHeader * refreshHeader, BOOL isBeginRefreshing){
           self.mj_header = refreshHeader ? refreshHeader : [MJRefreshNormalHeader new];
           __weak typeof(self) weakSelf = self;
          [self.mj_header setRefreshingBlock:^{
              [weakSelf headerRefreshStart];
          }];
        if (isBeginRefreshing) {
            [self.mj_header beginRefreshing];
        }
           return self;
       };
}

- (KKTableView * _Nonnull (^)(MJRefreshFooter * _Nullable, BOOL))addFooterRefresh {
    return ^(MJRefreshFooter * refreshFooter, BOOL isBeginRefreshing){
        self.mj_footer = refreshFooter ? refreshFooter : [MJRefreshAutoNormalFooter new];
        __weak typeof(self) weakSelf = self;
       [self.mj_footer setRefreshingBlock:^{
           [weakSelf footerRefreshStart];
       }];
        if (isBeginRefreshing) {
            [self.mj_footer beginRefreshing];
        }
        return self;
    };
}


- (KKTableView * _Nonnull (^)(void))endRefresh {
    return ^{
        if (self.mj_header.isRefreshing) [self.mj_header endRefreshing];
        if (self.mj_footer.isRefreshing) [self.mj_footer endRefreshing];
        return self;
    };
}

- (KKTableView * _Nonnull (^)(void))endRefreshWithReload {
    return ^{
        if (self.mj_header.isRefreshing) [self.mj_header endRefreshing];
        if (self.mj_footer.isRefreshing) [self.mj_footer endRefreshing];
        [self reloadData];
        return self;
    };
}

- (KKTableView * _Nonnull (^)(void))startLoading {
    return ^{
        self.kEmptyView.loading = YES;
        return self;
    };
}

- (KKTableView * _Nonnull (^)(void))endLoading {
    return ^{
        self.kEmptyView.loading = NO;
        return self;
    };
}

- (KKTableView * _Nonnull (^)(KKEmptyEntityCreator * _Nonnull))emptyView {
    return ^(KKEmptyEntityCreator * emptyCreator){
        self.kEmptyView.emptyEntityCreator = emptyCreator;
        [self addSubview:self.kEmptyView];
        return self;
    };
}

- (KKTableView * _Nonnull (^)(UIView * _Nonnull))customEmptyView {
    return ^(UIView * customEmptyView){
        self.kCustomEmptyView = customEmptyView;
        [self addSubview:self.kCustomEmptyView];
        return self;
    };
}

- (KKTableView *(^)(NSArray<NSString *> * titles))addSectionIndexTitles {
    return ^(NSArray<NSString *> * titles){
        self.kDatasource.sectionIndexTitles = titles;
        return self;
    };
}

- (KKTableView * _Nonnull (^)(NSString * _Nullable, NSString * _Nullable, NSString * _Nullable))errorNotice {
    return ^(NSString * imageName, NSString * title, NSString * detail){
        self.kEmptyView.emptyEntityCreator.emptyEntity.errorImageName = imageName;
        self.kEmptyView.emptyEntityCreator.emptyEntity.errorTitle     = title;
        self.kEmptyView.emptyEntityCreator.emptyEntity.errorDetail    = detail;
        self.kEmptyView.hasError = YES;
        return self;
    };
}


- (KKTableViewDataSource *)kDatasource {
    if (!_kDatasource) {
        _kDatasource = [[KKTableViewDataSource alloc] init];
    }
    return _kDatasource;
}

- (KKListEmptyView *)kEmptyView {
    if (!_kEmptyView) {
        _kEmptyView = [[KKListEmptyView alloc] init];
        __weak typeof(self) weakSelf = self;
        _kEmptyView.reloadCallback = ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            strongSelf->_pageNum = 1;
            if (strongSelf.kProtocol && [strongSelf.kProtocol respondsToSelector:@selector(tableView:startingReloadData:)]) {
                [strongSelf.kProtocol tableView:strongSelf startingReloadData:1];
            }
        };
    }
    return _kEmptyView;
}

@end

