//
//  KKListEmptyView.h
//  KKTableView
//
//  Created by KKWONG on 2020/9/26.
//  Copyright © 2020 KKWONG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKEmptyEntityCreator.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^KKEmptyViewReloadCallback)(void);
@interface KKListEmptyView : UIView
/// 空数据创造者
@property (nonatomic, strong) KKEmptyEntityCreator * emptyEntityCreator;

/// 加载状态
@property (nonatomic, assign, getter=isLoading) BOOL loading;

/// 发生错误
@property (nonatomic, assign, getter=isHasError) BOOL hasError;

/// 重新加载回调
@property (nonatomic, copy) KKEmptyViewReloadCallback reloadCallback;
@end

NS_ASSUME_NONNULL_END
