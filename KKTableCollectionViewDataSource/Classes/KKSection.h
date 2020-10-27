//
//  KKSection.h
//  KKTableView
//
//  Created by KKWONG on 2020/9/8.
//  Copyright © 2020 KKWONG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KKContextualActionCreator.h"
@class KKSection;

NS_ASSUME_NONNULL_BEGIN
typedef void(^RowCallBack)(id cell, id data, NSIndexPath *indexPath);
typedef void(^HeaderFooterViewCallBack)(UIView * view, NSInteger section);
typedef void(^SelectedCallBack)(id data, NSIndexPath *indexPath);
typedef void(^CommitEditingStyleCallBack)(UITableViewCellEditingStyle editingStyle, NSIndexPath * indexPath);
@interface KKSection : NSObject

/// cell Class
@property (nonatomic, strong) Class cellClass;

@property (nonatomic, strong) UINib * cellNib;

///// cell名
//@property (nonatomic, copy) NSString * cellName;

/// cell_Id
@property (nonatomic, copy) NSString * identifier;

//@property (nonatomic, copy) NSString * headerFooterViewIdentifier;


/// 分区头标题
@property (nonatomic, copy) NSString * headerTitle;

/// 分区尾标题
@property (nonatomic, copy) NSString * footerTitle;

/// 分区头视图
@property (nonatomic, strong) UIView * headerView;

/// 分区尾视图
@property (nonatomic, strong) UIView * footerView;

/// 分区数据源
@property (nonatomic, strong) NSArray * datasource;

/// 分区行高
@property (nonatomic, assign) CGFloat  rowHeight;

/// 分区头高度
@property (nonatomic, assign) CGFloat  headerHeight;

/// 分区尾高度
@property (nonatomic, assign) CGFloat  footerHeight;

/// cell样式
@property (nonatomic, assign) UITableViewCellStyle  cellStyle;

/// cell创建回调
@property (nonatomic, copy) RowCallBack cellForRowCallBack;

/// 即将显示Cell回调
@property (nonatomic, copy) RowCallBack willDisplayCellCallBack;

/// 已经显示Cell回调
@property (nonatomic, copy) RowCallBack didEndDisplayingCellCallBack;

/// 即将显示头部视图回调
@property (nonatomic, copy) HeaderFooterViewCallBack willDisplayHeaderViewCallBack;

/// 头部视图已经显示回调
@property (nonatomic, copy) HeaderFooterViewCallBack didEndDisplayingHeaderViewCallBack;

/// 即将显示尾部视图回调
@property (nonatomic, copy) HeaderFooterViewCallBack willDisplayFooterViewCallBack;

/// 已经显示尾部视图回调
@property (nonatomic, copy) HeaderFooterViewCallBack didEndDisplayingFooterViewCallBack;

/// 即将选中行回调
@property (nonatomic, copy) SelectedCallBack willSelectRowCallBack;

/// 已选中行回调
@property (nonatomic, copy) SelectedCallBack didSelectRowCallBack;

/// 即将取消选中行回调
@property (nonatomic, copy) SelectedCallBack willDeselectRowCallBack;

/// 已取消选中行回调
@property (nonatomic, copy) SelectedCallBack didDeselectRowCallBack;

@property (nonatomic, copy) HeaderFooterViewCallBack headerFooterViewCallBack;

@property (nonatomic, copy) CommitEditingStyleCallBack commitEditingStyleCallBack;

@property (nonatomic, strong) NSArray<NSString *> * indexTitles;

@property (nonatomic, assign) UITableViewCellEditingStyle editingStyle;

/// cell尾部actions
@property (nonatomic, strong) NSArray<KKContextualActionCreator *> *trailingContextualActionCreators;

/// cell头部actions
@property (nonatomic, strong) NSArray<KKContextualActionCreator *> *leadingContextualActionCreators;
@end

NS_ASSUME_NONNULL_END
