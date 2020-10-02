//
//  KKEmptyEntity.h
//  KKTableView
//
//  Created by KKWONG on 2020/9/15.
//  Copyright © 2020 KKWONG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, KKEmptyViewLoadingPosition) {
    KKEmptyViewLoadingOnTopPosition = 0,
    KKEmptyViewLoadingOnCenterPosition
};

@interface KKEmptyEntity : NSObject

/// 空数据图片名
@property (nonatomic, copy) NSString * emptyImageName;

/// 空数据标题
@property (nonatomic, copy) NSString * emptyTitle;

/// 空数据标题文本颜色
@property (nonatomic, strong) UIColor * emptyTitleColor;

/// 空数据标题文本字体
@property (nonatomic, strong) UIFont * emptyTitleFont;

/// 空数据副标题
@property (nonatomic, copy) NSString * emptyDetail;

/// 空数据副标题文本颜色
@property (nonatomic, strong) UIColor * emptyDetailColor;

/// 空数据副标题文本字体
@property (nonatomic, strong) UIFont * emptyDetailFont;

/// 加载文本
@property (nonatomic, copy) NSString * emptyLoading;

/// 加载文本颜色
@property (nonatomic, strong) UIColor * emptyLoadingColor;

/// 加载文本字体
@property (nonatomic, strong) UIFont * emptyLoadingFont;

/// 请求错误图片名
@property (nonatomic, copy) NSString * errorImageName;

/// 请求错误标题
@property (nonatomic, copy) NSString * errorTitle;

/// 请求错误副标题
@property (nonatomic, copy) NSString * errorDetail;

/// 空数据最大显示的SIZE，不超过该SIZE的话自适应，默认 size(200,200), 暂时无效
@property (nonatomic, assign) CGSize emptyImageMaxSize;

/// 空数据内容显示的位置
@property (nonatomic, assign) KKEmptyViewLoadingPosition loadingPosition;

@end

NS_ASSUME_NONNULL_END
