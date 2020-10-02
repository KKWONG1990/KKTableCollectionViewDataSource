//
//  KKSectionCretor.h
//  KKTableView
//
//  Created by KKWONG on 2020/9/9.
//  Copyright © 2020 KKWONG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KKSection.h"
#import "KKContextualActionCreator.h"
NS_ASSUME_NONNULL_BEGIN

@interface KKSectionCreator : NSObject

/// 初始化一个分区Creator
+ (KKSectionCreator *(^)(void))init;

/// 分区头标题
- (KKSectionCreator *(^)(NSString * _Nullable headerTitle))headerTitle;

/// 分区尾标题
- (KKSectionCreator *(^)(NSString * _Nullable footerTitle))footerTitle;

/// 分区头视图
- (KKSectionCreator *(^)(UIView * _Nullable headerView))headerView;

/// 分区尾视图
- (KKSectionCreator *(^)(UIView * _Nullable footerView))footerView;

/// 分区头高度
- (KKSectionCreator *(^)(CGFloat headerHeight))headerHeight;

/// 分区尾高度
- (KKSectionCreator *(^)(CGFloat footerHeight))footerHeight;

/// 行高
- (KKSectionCreator *(^)(CGFloat rowHeight))rowHeight;

/// 数据源
- (KKSectionCreator *(^)(NSArray * _Nullable data))datasource;

/// cell类
- (KKSectionCreator *(^)(Class cellClass))cellClass;

/// cell类
- (KKSectionCreator *(^)(UINib * cellNib))cellNib;

///// cell名
//- (KKSectionCreator *(^)(NSString * cellName))cellName;

/// cell_id
- (KKSectionCreator *(^)(NSString * identifier))identifier;

- (KKSectionCreator *(^)(RowCallBack cellForRowBlock))cellForRowBlock;

- (KKSectionCreator *(^)(NSArray<NSString *> *))sectionIndexTitles;

- (KKSectionCreator *(^)(UITableViewCellEditingStyle editingStyle))editingStyle;

- (KKSectionCreator *(^)(NSArray<KKContextualActionCreator *> * creators))trailingContextualActionCreator;
- (KKSectionCreator *(^)(NSArray<KKContextualActionCreator *> * creators))leadingContextualActionCreator;

/// 分区
@property (nonatomic, strong, readonly) KKSection * section;
@end

NS_ASSUME_NONNULL_END
