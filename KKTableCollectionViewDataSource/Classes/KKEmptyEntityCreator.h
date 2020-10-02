//
//  KKEmptyEntityCreator.h
//  KKTableView
//
//  Created by KKWONG on 2020/9/15.
//  Copyright © 2020 KKWONG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KKEmptyEntity.h"
NS_ASSUME_NONNULL_BEGIN

@interface KKEmptyEntityCreator : NSObject

/// 初始化空数据实体类创造者
+ (KKEmptyEntityCreator *(^)(void))init;

/// 设置空数据图片，传入一个图片名
- (KKEmptyEntityCreator *(^)(NSString * _Nullable name))emptyImageName;

/// 设置空数据显示的标题
- (KKEmptyEntityCreator *(^)(NSString * _Nullable title))emptyTitle;

/// 设置空数据显示的标题颜色
- (KKEmptyEntityCreator *(^)(UIColor * _Nullable titleColor))emptyTitleColor;

/// 设置空数据显示的标题字体
- (KKEmptyEntityCreator *(^)(UIFont * _Nullable titleFont))emptyTitleFont;

/// 设置空数据显示的详情
- (KKEmptyEntityCreator *(^)(NSString * _Nullable detail))emptyDetail;

/// 设置空数据详情文本颜色
- (KKEmptyEntityCreator *(^)(UIColor * _Nullable detailColor))emptyDetailColor;

/// 设置空数据详情文本字体
- (KKEmptyEntityCreator *(^)(UIFont * _Nullable detailFont))emptyDetailFont;

/// 设置空数据图片的最大显示Size, 不超过该SIZE的话自适应，默认 size(200,200)
- (KKEmptyEntityCreator *(^)(CGSize maxSize))emptyImageMaxSize;

/// 设置加载文本
- (KKEmptyEntityCreator *(^)(NSString * _Nullable title))emptyLoadingTitle;

/// 设置加载文本颜色
- (KKEmptyEntityCreator *(^)(UIColor * _Nullable detailColor))emptyLoadingColor;

/// 设置加载字体大小
- (KKEmptyEntityCreator *(^)(UIFont * _Nullable detailFont))emptyLoadingFont;

/// 设置空数据内容显示的位置 - 默认居中显示
- (KKEmptyEntityCreator *(^)(KKEmptyViewLoadingPosition position))emptyLoadingPosition;

/// 设置请求发生错误时的显示提示
- (KKEmptyEntityCreator *(^)( NSString * _Nullable errorImageName, NSString * _Nullable errorTitle, NSString * _Nullable errorDetail))errorNotice;

@property (nonatomic, strong) KKEmptyEntity * emptyEntity;
@end

NS_ASSUME_NONNULL_END
